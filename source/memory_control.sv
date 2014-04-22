/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input logic CLK, nRST,
  input logic halted0, halted1, flushed0, flushed1, evict0, evict1,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  parameter CPUS = 2;

  logic active_core;
  logic next_active_core;
  logic active;
  logic next_active;
  logic ccdataready;
  logic ccdataready_next;
  logic ccmemtransfer;
  logic ccmemtransfer_next;

  typedef enum {IDLE, ARBITER, SNOOP, WRITE_BACK_0, WRITE_BACK_1, FETCH_CACHE_0, FETCH_CACHE_1, MISS_0, MISS_1, EVICTION, HALT} states;
  states cstate, nstate;

  always_comb
  begin
    ccif.ccinv[0] = ccif.cctrans[1] && ccif.ccwrite[1];
    ccif.ccinv[1] = ccif.cctrans[0] && ccif.ccwrite[0];
  end

  //state transition
  always_ff @(posedge CLK, negedge nRST)
  begin
      if (!nRST) begin
          cstate <= IDLE;
          active_core <= 0;
          active <= 0;
          ccdataready <= 0;
          ccmemtransfer <= 0;
      end else begin
          cstate <= nstate;
          active_core <= next_active_core;
          active <= next_active;
          ccdataready <= ccdataready_next;
          ccmemtransfer <= ccmemtransfer_next;
      end
  end

  always_comb
  begin
    nstate = cstate;
    next_active_core = active_core;
    next_active = active;
    ccdataready_next = ccdataready;
    ccmemtransfer_next = ccmemtransfer;

    if (cstate == IDLE) begin
        // $display ("POOP5");
        if(halted0 && !flushed0) begin
            nstate = HALT;
            next_active = 1;
            next_active_core = 0;
        end else if(halted1 && !flushed1) begin
            next_active = 1;
            nstate = HALT;
            next_active_core = 1;
        end
        else begin
            next_active = 0;
            if (ccif.dREN[0] || ccif.dWEN[0]) || ccif.dREN[1]  || ccif.dWEN[1])
                nstate = ARBITER;
            else if (ccif.iREN[0] && !halted0)
                next_active_core = 0;
            else if (ccif.iREN[1] && !halted1)
                next_active_core = 1;
        end
    end else if (cstate == ARBITER) begin
        next_active = 0;
        if ((ccif.dWEN[0] || ccif.dREN[0]) && !halted0)
            next_active_core = 0;
        else if ((ccif.dWEN[1] || ccif.dREN[1]) && !halted1)
            next_active_core = 1;

        nstate = SNOOP; //This needs to be changed for eviction
    end else if (cstate == SNOOP) begin
        next_active = 1;
        if (!active_core) begin
            //stuff for core 0 goes here
            nstate = evict0 ? EVICTION :
                     ccif.dstore[1] == 0 || halted1 ? MISS_0 :
                     ccif.cctrans[1] && ccif.ccwrite[1] ? WRITE_BACK_0 : FETCH_CACHE_0;
        end else begin
            //stuff for core 1 goes here
            nstate = evict1 ? EVICTION :
                     ccif.dstore[0] == 0 || halted0 ? MISS_0 :
                     ccif.cctrans[0] && ccif.ccwrite[0] ? WRITE_BACK_0 : FETCH_CACHE_0;
        end

        if (nstate == FETCH_CACHE_0)
            ccdataready_next = 1;
        else if (nstate == WRITE_BACK_0)
            ccmemtransfer_next = 1;

    end else if (cstate == EVICTION) begin
        if(active_core && !evict1)
            nstate = ccif.dstore[0] == 0 || halted0 ? MISS_0 :
                     ccif.cctrans[0] && ccif.ccwrite[0] ? WRITE_BACK_0 : FETCH_CACHE_0;
        else if(!active_core && !evict0)
            nstate = ccif.dstore[1] == 0 || halted1 ? MISS_0 :
                     ccif.cctrans[1] && ccif.ccwrite[1] ? WRITE_BACK_0 : FETCH_CACHE_0;
    end else if (cstate == WRITE_BACK_0) begin
        next_active = 1;
        if (!active_core) begin
            if (ccif.dwait[0] == 0)
                nstate = WRITE_BACK_1;
        end else begin
            if (ccif.dwait[1] == 0)
                nstate = WRITE_BACK_1;
        end
    end else if (cstate == WRITE_BACK_1) begin
        next_active = 0;
        if (!active_core) begin
            if (ccif.dwait[0] == 0) begin
                ccmemtransfer_next = 0;
                nstate = IDLE;
            end
        end else begin
            if (ccif.dwait[1] == 0) begin
                ccmemtransfer_next = 0;
                nstate = IDLE;
            end
        end
    end else if (cstate == FETCH_CACHE_0) begin
        next_active = 1;
        if (!active_core) begin
            ccdataready_next = 1;
            nstate = FETCH_CACHE_1;
        end else begin
            ccdataready_next = 1;
            nstate = FETCH_CACHE_1;
        end
    end else if (cstate == FETCH_CACHE_1) begin
        next_active = 0;
        if (!active_core) begin
            ccdataready_next = 0;
            nstate = IDLE;
        end else begin
            ccdataready_next = 0;
            nstate = IDLE;
        end
    end else if(cstate == MISS_0) begin
        next_active = 1;
        if (!active_core) begin
            if (ccif.dwait[0] == 0)
                nstate = MISS_1;
        end else begin
            if (ccif.dwait[1] == 0)
                nstate = MISS_1;
        end
    end else if(cstate == MISS_1) begin
        next_active = 0;
        if (!active_core) begin
            if(ccif.dwait[0] == 0)
                nstate = IDLE;
        end else begin
            if (ccif.dwait[1] == 0)
                nstate = IDLE;
        end
    end else if(cstate == HALT) begin
        if (!active_core) begin
            if(flushed0) begin
                nstate = IDLE;
                next_active = 0;
            end
        end else begin
            if(flushed1) begin
                nstate = IDLE;
                next_active = 0;
            end
        end
    end
  end

  always_comb
  begin
    ccif.ccwait[0] = 0;
    ccif.ccwait[1] = 0;
    ccif.ccsnoopaddr[0] = 0;
    ccif.ccsnoopaddr[1] = 0;

    casez(cstate)
      IDLE: begin
        if(ccif.daddr[0])
          ccif.ccsnoopaddr[1] = ccif.daddr[0];
        else if(ccif.daddr[1])
          ccif.ccsnoopaddr[0] = ccif.daddr[1];
      end
      ARBITER: begin
      end
      SNOOP: begin
        if (!active_core && !halted1) begin
            ccif.ccsnoopaddr[1] = ccif.daddr[0];
            ccif.ccwait[1] = 1;
        end else if(active_core && !halted0) begin
            ccif.ccsnoopaddr[0] = ccif.daddr[1];
            ccif.ccwait[0] = 1;
        end
      end
      EVICTION: begin
      end
      WRITE_BACK_0: begin
        if (!active_core) begin
            ccif.ccsnoopaddr[1] = ccif.daddr[0];
            ccif.ccwait[1] = 1;
        end else begin
            ccif.ccsnoopaddr[0] = ccif.daddr[1];
            ccif.ccwait[0] = 1;
        end
      end
      WRITE_BACK_1: begin
        if (!active_core) begin
            ccif.ccsnoopaddr[1] = ccif.daddr[0];
            ccif.ccwait[1] = 1;
        end else begin
            ccif.ccsnoopaddr[0] = ccif.daddr[1];
            ccif.ccwait[0] = 1;
        end
      end
      FETCH_CACHE_0: begin
        if (!active_core) begin
            ccif.ccsnoopaddr[1] = ccif.daddr[0];
            ccif.ccwait[1] = 1;
        end else begin
            ccif.ccsnoopaddr[0] = ccif.daddr[1];
            ccif.ccwait[0] = 1;
        end
      end
      FETCH_CACHE_1: begin
        if (!active_core) begin
            ccif.ccsnoopaddr[1] = ccif.daddr[0];
            ccif.ccwait[1] = 1;
        end else begin
            ccif.ccsnoopaddr[0] = ccif.daddr[1];
            ccif.ccwait[0] = 1;
        end
      end
      MISS_0: begin
      end
      MISS_1: begin
      end
    endcase
  end






  always_comb
  begin
    //initialize
    ccif.iwait[0] = 1;
    ccif.iwait[1] = 1;
    ccif.dwait[0] = 1;
    ccif.dwait[1] = 1;
    ccif.iload[0] = ccif.ramload;
    ccif.iload[1] = ccif.ramload;
    ccif.dload[0] = ccif.ramload;
    ccif.dload[1] = ccif.ramload;

    ccif.ramstore = 0;
    ccif.ramaddr = 0;
    ccif.ramWEN = 0;
    ccif.ramREN = 0;

    //defaulting everything
    //if ram is in access then the data is correct
    //if data read signal is sent
    if(!active_core && active) begin
        // $display ("POOP1");
        if (ccif.dREN[0] == 1) begin
          ccif.ramREN = 1;
          ccif.ramWEN = 0;
          ccif.ramaddr = ccif.daddr[0];
          ccif.iwait[0] = 1;
          ccif.dwait[0] = 1;

          if (ccdataready) begin
              ccif.dload[0] = ccif.dstore[1];
              ccif.dwait[0] = 0;
          end else if (ccif.ramstate == ACCESS) begin
            if (ccmemtransfer)
                ccif.dload[0] = ccif.dstore[1];
            ccif.dwait[0] = 0;
          end
        //if data write signal is set
        end else if (ccif.dWEN[0] == 1) begin
          ccif.ramREN = 0;
          ccif.ramWEN = 1;
          ccif.iwait[0] = 1;
          ccif.dwait[0] = 1;
          ccif.ramaddr = ccif.daddr[0];
          ccif.ramstore = ccif.dstore[0];

          if (ccdataready) begin
            ccif.dload[0] = ccif.dstore[1];
            ccif.dwait[0] = 0;
          end else if (ccif.ramstate == ACCESS) begin
            if (ccmemtransfer)
                ccif.dload[0] = ccif.dstore[1];
            ccif.dwait[0] = 0;
          end
        end
    end else if(active_core && active) begin
        // $display ("POOP2");
        if (ccif.dREN[1] == 1) begin // && !ccif.dwait[0]
            ccif.ramREN = 1;
            ccif.ramWEN = 0;
            ccif.ramaddr = ccif.daddr[1];
            ccif.iwait[1] = 1;
            ccif.dwait[1] = 1;

            if (ccdataready) begin
                ccif.dload[1] = ccif.dstore[0];
                ccif.dwait[1] = 0;
            end else if (ccif.ramstate == ACCESS) begin
                if (ccmemtransfer)
                    ccif.dload[1] = ccif.dstore[0];
                ccif.dwait[1] = 0;
            end
        //if data write signal is set
        end else if (ccif.dWEN[1] == 1) begin // && !ccif.dwait[0]
            ccif.ramREN = 0;
            ccif.ramWEN = 1;
            ccif.iwait[1] = 1;
            ccif.dwait[1] = 1;
            ccif.ramaddr = ccif.daddr[1];
            ccif.ramstore = ccif.dstore[1];

            if (ccdataready) begin
                ccif.dload[1] = ccif.dstore[0];
                ccif.dwait[1] = 0;
            end else if (ccif.ramstate == ACCESS) begin
                if (ccmemtransfer)
                    ccif.dload[1] = ccif.dstore[0];
                ccif.dwait[1] = 0;
            end
        end
    end else if (!active_core) begin
        // $display ("POOP3");
        if (ccif.iREN[0] == 1) begin
            ccif.ramREN = 1;
            ccif.ramWEN = 0;

            ccif.iwait[0] = 1;
            ccif.dwait[0] = 1;
            ccif.ramaddr = ccif.iaddr[0];
            if (ccif.ramstate == ACCESS)
                ccif.iwait[0] = 0;
        end
    end else begin
        // $display ("POOP4");
        if (ccif.iREN[1] == 1) begin
            ccif.ramREN = 1;
            ccif.ramWEN = 0;
            ccif.iwait[1] = 1;
            ccif.dwait[1] = 1;
            ccif.ramaddr = ccif.iaddr[1];
            if (ccif.ramstate == ACCESS)
                ccif.iwait[1] = 0;
        end
    end
  end
endmodule

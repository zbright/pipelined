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
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc

  //ask Eric

  parameter CPUS = 2;

  logic active_core;
  logic next_active_core;
  logic active;

  //assign ccif.dREN [1] = 0;
  //assign ccif.dWEN [1] = 0;
  //assign ccif.iREN [1] = 0;
  //assign ccif.iwait [1] = 0;
  //assign ccif.dwait [1] = 0;

  typedef enum {IDLE, ARBITER, SNOOP, WRITE_BACK_0, WRITE_BACK_1, FETCH_CACHE_0, FETCH_CACHE_1, MISS_0, MISS_1, EVICTION} states;
  states cstate, nstate;




  //state transition
  always_ff @(posedge CLK, negedge nRST)
  begin
      if (!nRST) begin
          cstate <= IDLE;
          active_core <=0;
      end else begin
          cstate <= nstate;
          active_core <= next_active_core;
      end
  end

  always_comb
  begin
    nstate = cstate;
    next_active_core = active_core;

    if(cstate == IDLE) begin
        $display ("POOP5");
        active = 0;
        if(ccif.dREN[0] || ccif.dREN[1] || ccif.dWEN[0] || ccif.dWEN[1])
            nstate = ARBITER;
        else if(ccif.iREN[0])
            next_active_core = 0;
        else if(ccif.iREN[1])
            next_active_core = 1;
    end else if(cstate == ARBITER) begin
        active = 0;
        if(ccif.dWEN[0] || ccif.dREN[0])
            next_active_core = 0;
        else if (ccif.dWEN[1] || ccif.dREN[1])
            next_active_core = 1;

        nstate = SNOOP; //This needs to be changed for eviction
    end else if(cstate == EVICTION) begin
    end else if(cstate == SNOOP) begin
        active = 0;
        if(!active_core) begin
            //stuff for core 0 goes here
            nstate = MISS_0; //!ccif.ccwrite[1] ? MISS_0 :
                     //ccif.cctrans[1] ? WRITE_BACK_0 : FETCH_CACHE_0;
        end else begin
            //stuff for core 1 goes here
            nstate = MISS_0; //!ccif.ccwrite[0] ? MISS_0 :
                     // ccif.cctrans[0] ? WRITE_BACK_0 : FETCH_CACHE_0;
        end

    end else if(cstate == WRITE_BACK_0) begin
    end else if(cstate == WRITE_BACK_1) begin
    end else if(cstate == FETCH_CACHE_0) begin
    end else if(cstate == FETCH_CACHE_1) begin
    end else if(cstate == MISS_0) begin
        active = 1;
        if(!active_core) begin
            if(ccif.dwait[0] == 0)
                nstate = MISS_1;
        end else begin
            if(ccif.dwait[1] == 0)
                nstate = MISS_1;
        end
    end else if(cstate == MISS_1) begin
        active = 1;
        if(!active_core) begin
            if(ccif.dwait[0] == 0)
                nstate = IDLE;
        end else begin
            if(ccif.dwait[1] == 0)
                nstate = IDLE;
        end
    end
  end

  always_comb
  begin
    ccif.ccinv[0] = 0;
    ccif.ccinv[1] = 0;
    ccif.ccwait[0] = 1;
    ccif.ccwait[1] = 1;
    ccif.ccsnoopaddr[0] = 0;
    ccif.ccsnoopaddr[1] = 0;

    casez(cstate)
      IDLE: begin
      end
      ARBITER: begin
      end
      EVICTION: begin
      end
      SNOOP: begin
        if(active_core)
            ccif.ccsnoopaddr[1] = ccif.daddr[0];
        else
            ccif.ccsnoopaddr[0] = ccif.daddr[1];
      end
      WRITE_BACK_0: begin
      end
      WRITE_BACK_1: begin
      end
      FETCH_CACHE_0: begin
      end
      FETCH_CACHE_1: begin
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
        $display ("POOP1");
        if (ccif.dREN[0] == 1) begin
          ccif.ramREN = 1;
          ccif.ramWEN = 0;
          ccif.ramaddr = ccif.daddr[0];
          ccif.iwait[0] = 1;
          ccif.dwait[0] = 1;
          if (ccif.ramstate == ACCESS) begin
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
          if (ccif.ramstate == ACCESS) begin
            ccif.dwait[0] = 0;
          end
        end
    end else if(active_core && active) begin
        $display ("POOP2");
        if (ccif.dREN[1] == 1) begin // && !ccif.dwait[0]
            ccif.ramREN = 1;
            ccif.ramWEN = 0;
            ccif.ramaddr = ccif.daddr[1];
            ccif.iwait[1] = 1;
            ccif.dwait[1] = 1;
            if (ccif.ramstate == ACCESS) begin
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
            if (ccif.ramstate == ACCESS) begin
                ccif.dwait[1] = 0;
            end
        end
    end else if (!active_core) begin
        $display ("POOP3");
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
        $display ("POOP4");
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
    // else if (ccif.iREN != 0) begin
    //     ccif.ramREN = 1;
    //     ccif.ramWEN = 0;

    //     if(ccif.iREN[0] == 1) begin
    //         ccif.iwait[0] = 1;
    //         ccif.dwait[0] = 1;
    //     end

    //     if(ccif.iREN[1] == 1) begin
    //         ccif.iwait[1] = 1;
    //         ccif.dwait[1] = 1;
    //     end

    //     if(ccif.iREN[0] == 1) begin
    //         ccif.ramaddr = ccif.iaddr[0];
    //         if (ccif.ramstate == ACCESS)
    //             ccif.iwait[0] = 0;
    //     end else begin
    //         ccif.ramaddr = ccif.iaddr[1];
    //         if (ccif.ramstate == ACCESS)
    //             ccif.iwait[1] = 0;
    //     end
    // end
  end
endmodule

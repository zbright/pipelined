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

  //assign ccif.dREN [1] = 0;
  //assign ccif.dWEN [1] = 0;
  //assign ccif.iREN [1] = 0;
  //assign ccif.iwait [1] = 0;
  //assign ccif.dwait [1] = 0;

  typedef enum {IDLE, WRITE_ZERO, WAIT_ZERO, READ_ZERO, WRITE_ONE, WAIT_ONE, READ_ONE, MEM_ACCESS} states;
  states cstate, nstate;


  //state transition
  always_ff @(posedge CLK, negedge nRST)
  begin
      if (!nRST)
          cstate <= IDLE;
      else
          cstate <= nstate;
  end

  always_comb
  begin
    nstate = cstate;

    if (cstate == IDLE) begin
      nstate =  (ccif.cctrans[0] && ccif.ccwrite[0]) ? WRITE_ZERO :
                (ccif.cctrans[0] && !ccif.ccwrite[0]) ? READ_ZERO :
                (ccif.cctrans[1] && ccif.ccwrite[1]) ? WRITE_ONE :
                (ccif.cctrans[1] && !ccif.ccwrite[1]) ? READ_ONE : IDLE;
    end else if (cstate == WRITE_ZERO) begin
      nstate = ccif.dWEN[1] ? WAIT_ZERO : MEM_ACCESS;
    end else if ((cstate == WAIT_ZERO) && ccif.ramstate == ACCESS) begin
      nstate = MEM_ACCESS;
    end else if (cstate == READ_ZERO) begin
      nstate =  ccif.dREN[1] ? WAIT_ZERO :
                ccif.dREN[0] ? MEM_ACCESS : IDLE;
    end else if (cstate == WRITE_ONE) begin
      nstate =  !ccif.dWEN[0] ? MEM_ACCESS :
                 ccif.dWEN[0] ? WAIT_ONE : IDLE;
    end else if (cstate == WAIT_ONE && ccif.ramstate == ACCESS) begin
      nstate = MEM_ACCESS;
    end else if (cstate == READ_ONE) begin
      nstate =  ccif.dREN[0] ? WAIT_ONE :
              !ccif.dREN[0] ? MEM_ACCESS : IDLE;
    end else if (cstate == MEM_ACCESS) begin
      nstate = IDLE;
    end
  end

  always_comb
  begin
    ccif.ccinv[0] = 0;
    ccif.ccinv[1] = 0;
    ccif.ccwait[0] = 0;
    ccif.ccwait[1] = 0;
    ccif.ccsnoopaddr[0] = 0;
    ccif.ccsnoopaddr[1] = 0;
    casez(cstate)
      IDLE: begin
      end
      WRITE_ONE: begin
        ccif.ccinv[0] = 1;
        ccif.ccsnoopaddr[0] = ccif.daddr[1];
        ccif.ccwait[0] = 1;
      end
      WRITE_ZERO: begin
        ccif.ccinv[1] = 1;
        ccif.ccsnoopaddr = ccif.daddr[0];
        ccif.ccwait[1] = 1;
      end
      READ_ONE: begin
        ccif.ccsnoopaddr[0] = ccif.daddr[1];
        ccif.ccwait[0] = 1;
      end
      READ_ZERO: begin
        ccif.ccsnoopaddr[1] = ccif.daddr[0];
        ccif.ccwait[0] = 1;
      end
      WAIT_ONE: begin
        ccif.ccwait[0] = 1;
      end
      WAIT_ZERO: begin
        ccif.ccwait[1] = 1;
      end
      MEM_ACCESS: begin
      end
    endcase
  end






  always_comb
  begin
    //initialize
    ccif.iwait = 1;
    ccif.dwait = 1;
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

        end else if (ccif.dREN[1] == 1  && !ccif.dwait[0]) begin
            ccif.ramREN = 1;
            ccif.ramWEN = 0;
            ccif.ramaddr = ccif.daddr[0];
            ccif.iwait[1] = 1;
            ccif.dwait[1] = 1;
            if (ccif.ramstate == ACCESS) begin
                ccif.dwait[1] = 0;
            end
        //if data write signal is set
        end else if (ccif.dWEN[1] == 1  && !ccif.dwait[0]) begin
            ccif.ramREN = 0;
            ccif.ramWEN = 1;
            ccif.iwait[1] = 1;
            ccif.dwait[1] = 1;
            ccif.ramaddr = ccif.daddr[1];
            ccif.ramstore = ccif.dstore[1];
            if (ccif.ramstate == ACCESS) begin
                ccif.dwait[1] = 0;
            end

        end else if (ccif.iREN != 0) begin
            ccif.ramREN = 1;
            ccif.ramWEN = 0;

            if(ccif.iREN[0] == 1) begin
                ccif.iwait[0] = 1;
                ccif.dwait[0] = 1;
            end

            if(ccif.iREN[1] == 1) begin
                ccif.iwait[1] = 1;
                ccif.dwait[1] = 1;
            end

            if(ccif.iREN[0] == 1) begin
                ccif.ramaddr = ccif.iaddr[0];
                if (ccif.ramstate == ACCESS)
                    ccif.iwait[0] = 0;
            end else begin
                ccif.ramaddr = ccif.iaddr[1];
                if (ccif.ramstate == ACCESS)
                    ccif.iwait[1] = 0;
            end

        end


    // end else if (ccif.iREN[0] == 1) begin
    //  ccif.ramREN = 1;
    //  ccif.ramWEN = 0;
    //  ccif.iwait[0] = 1;
    //  ccif.dwait[0] = 1;
    //  ccif.ramaddr = ccif.iaddr[0];
    //  if (ccif.ramstate == ACCESS) begin
    //    ccif.iwait[0] = 0;
    //  end
    // end else if (ccif.iREN[1] == 1  && !ccif.iwait[0]) begin
  //           ccif.ramREN = 1;
  //           ccif.ramWEN = 0;
  //           ccif.iwait[1] = 1;
  //           ccif.dwait[1] = 1;
  //           ccif.ramaddr = ccif.iaddr[1];
  //           if (ccif.ramstate == ACCESS) begin
  //               ccif.iwait[1] = 0;
  //           end
  //       end

  end

endmodule

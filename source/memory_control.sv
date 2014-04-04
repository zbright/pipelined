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
		// 	ccif.ramREN = 1;
		// 	ccif.ramWEN = 0;
		// 	ccif.iwait[0] = 1;
		// 	ccif.dwait[0] = 1;
		// 	ccif.ramaddr = ccif.iaddr[0];
		// 	if (ccif.ramstate == ACCESS) begin
		// 		ccif.iwait[0] = 0;
		// 	end
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

`include "cpu_ram_if.vh"
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module ram_tb;
  // clock period
  parameter PERIOD = 20;

  // signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;

   cpu_ram_if crif();

   test PROG(CLK, nRST);

`ifndef MAPPED
   ram DUT(CLK,nRST,crif);

`else
   ram DUT(
	   CLK,
	   nRST,
	   crif.ramload,
	   crif.ramstate,
	   crif.ramWEN,
	   crif.ramREN,
	   crif.ramstore,
	   crif.ramaddr
	   );
`endif
endmodule // ram_tb

program test(input logic CLK, output logic nRST);
   
  import cpu_types_pkg::*;

   int 	unsigned cycles = 0;
   parameter PERIOD = 20;
   
   initial
     begin
	nRST = 0;
	crif.ramWEN = 0;
	crif.ramREN = 0;
	crif.ramstore = 0;
	crif.ramaddr = 0;

	
	
	@(posedge CLK);
	$display("Starting Ram.");
	nRST = 1;

	crif.ramWEN = 1;
	crif.ramstore = 6;
	crif.ramaddr = 32'h000000F0;
	#(PERIOD)
	#(PERIOD)
	#(PERIOD)
	crif.ramWEN = 0;
	crif.ramREN = 1;

	if(crif.ramload == 6)
	  $display("Asserted");
	
	
	
	#(PERIOD)
	#(PERIOD)
	#(PERIOD)
	
	nRST = 0;
	dump_memory();

	
	$finish;
	
     end
   
   task automatic dump_memory();
    string filename = "memcpu.hex";
    int memfd;

    crif.ramaddr = 0;
    crif.ramWEN = 0;
    crif.ramREN = 0;

    memfd = $fopen(filename,"w");
    if (memfd)
      $display("Starting memory dump.");
    else
      begin $display("Failed to open %s.",filename); $finish; end

    for (int unsigned i = 0; memfd && i < 16384; i++)
    begin
      int chksum = 0;
      bit [7:0][7:0] values;
      string ihex;

      crif.ramaddr = i << 2;
      crif.ramREN = 1;
      repeat (2) @(posedge CLK);
      if (crif.ramload === 0)
	begin
           continue;
	end
       
      values = {8'h04,16'(i),8'h00,crif.ramload};
      foreach (values[j])
        chksum += values[j];
      chksum = 16'h100 - chksum;
      ihex = $sformatf(":04%h00%h%h",16'(i),crif.ramload,8'(chksum));
      $fdisplay(memfd,"%s",ihex.toupper());
    end //for
    if (memfd)
    begin
      crif.ramREN = 0;
      $fdisplay(memfd,":00000001FF");
      $fclose(memfd);
      $display("Finished memory dump.");
    end
  endtask
endprogram

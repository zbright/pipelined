
// mapped needs this
`include "cpu_ram_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module ram_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  cpu_ram_if ramif ();
  // test program
  test PROG ();
  // DUT
`ifndef MAPPED
  ram DUT(CLK, nRST, ramif);
`else
  ram DUT(
    .\ramif.ramaddr (ramif.ramaddr),
    .\ramif.ramstore (ramif.ramstore),
    .\ramif.ramREN (ramif.ramREN),
    .\ramif.ramWEN (ramif.ramWEN),
    .\ramif.ramstate (ramif.ramstate),
    .\ramif.ramload (ramif.ramload),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

 
initial begin
 
  //initialize the variables
  nRST = 0;
  ramif.ramWEN = 0;
  ramif.ramREN = 0;
  ramif.ramaddr = 0;
  ramif.ramstore = 0;

  #30 
  nRST = 1;
  #30
  //trying to read at address 4
  ramif.ramaddr = 4;
  ramif.ramREN = 1;

  #30 
  ramif.ramREN = 0;
  #30
  //trying to write  a value to address 8
  ramif.ramaddr = 8;
  ramif.ramstore = 123456;
  ramif.ramWEN = 1;
  
  #30
  //reading the address that was just written
  ramif.ramWEN = 0;
  ramif.ramREN = 1;
  
  #30
  //turn off the write and read enable signals
  ramif.ramWEN = 0;
  ramif.ramREN = 0;
  nRST = 0;
  
  #10

  dump_memory();

 end


  task automatic dump_memory();
    string filename = "memcpu.hex";
    int memfd;

    ramif.ramaddr = 0;
    ramif.ramWEN = 0;
    ramif.ramREN = 0;

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
      //      $display("did some shit here");
      ramif.ramaddr = i << 2;
      ramif.ramREN = 1;
      repeat (2) @(posedge CLK);
      if (ramif.ramload === 0)
        continue;
      values = {8'h04,16'(i),8'h00,ramif.ramload};
      foreach (values[j])
        chksum += values[j];
      chksum = 16'h100 - chksum;
      //$display("did some shit here");
      ihex = $sformatf(":04%h00%h%h",16'(i),ramif.ramload,8'(chksum));
      $fdisplay(memfd,"%s",ihex.toupper());
    end //for
    //if (memfd)
    //begin
      $display("did some shit there");
      ramif.ramREN = 0;
      $fdisplay(memfd,":00000001FF");
      $fclose(memfd);
      $display("Finished memory dump.");
    //end
  endtask 

endmodule



program test;
endprogram

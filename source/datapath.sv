/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);
   
  // import types
   import cpu_types_pkg::*;

  // pc init
   parameter PC_INIT = 0;
   word_t nextPC, currentPC, pcPlus4, branchPC, jRPC, 
     jPC, branchAddPC, shiftLeft2Out;
   word_t extendOut, shift16Out, aluSourceMuxOut, aluOut;
   logic dREN, dWEN, extendType, regWrite, branchFlag, 
		   branchSelect, cuHalt;
   logic aluNeg, aluOverflow, aluZero, haltFlag;
   logic [1:0] aluSource, memToReg, regDest, nextPCSelect;
   logic [3:0] aluOP;

   program_counter programCounter(CLK, nRST, nextPC, cuHalt, dpif.ihit, currentPC);

   register_file_if rfif();
   
   add_4 add4(currentPC, pcPlus4);
   
   add_32 add32(pcPlus4, shiftLeft2Out, branchAddPC);
   
   alu ALU(aluOP, rfif.rdat1, aluSourceMuxOut, aluOut, aluNeg, aluOverflow, aluZero);
   
   alu_source_mux aluSourceMux(dpif.imemload[10:6], rfif.rdat2, extendOut, 
			       aluSource, aluSourceMuxOut);
   
   branch_check branchCheck(branchFlag, aluZero, branchSelect);
   
   branch_mux branchMux(pcPlus4, branchAddPC, branchSelect, branchPC);
   
   control_unit controlUnit(dpif.imemload, dREN, dWEN, aluSource, aluOP, 
			    extendType, memToReg, nextPCSelect, regDest, 
			    regWrite, branchFlag, cuHalt);
   
   extender extender(dpif.imemload[15:0], extendType, extendOut);
   
   mem_to_reg_mux memToRegMux(rfif.rdat1, aluOut, dpif.dmemload, shift16Out, 
			      memToReg, rfif.wdat);
   
   next_pc_mux nextPCMux(pcPlus4, branchPC, jRPC, jPC, nextPCSelect, nextPC);
   
   reg_dest_mux regDestMux(dpif.imemload[20:16], dpif.imemload[15:11], regDest, rfif.wsel);
   
   register_file registerFile(CLK, nRST, rfif);
   
   request_unit requestUnit(dWEN, dREN, dpif.dhit, CLK, dpif.dmemWEN, dpif.dmemREN);
   
   shift_left_2 shiftLeft2(extendOut, shiftLeft2Out);
   
   shift_left_16 shiftLeft16(dpif.imemload[15:0], shift16Out);
   
   shift_left_with_pc shiftLeftPC(currentPC, dpif.imemload[25:0], jPC);

   assign dpif.imemaddr = currentPC;
   assign dpif.imemREN = 1;
   assign rfif.rsel1 = dpif.imemload[25:21];
   assign rfif.rsel2 = dpif.imemload[20:16];
   assign rfif.WEN = regWrite;
   assign dpif.dmemaddr = aluOut;
   assign dpif.dmemstore = rfif.rdat2;
   assign dpif.halt = cuHalt;
   
endmodule

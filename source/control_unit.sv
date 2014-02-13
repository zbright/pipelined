`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;

module control_unit
(
 input 		    word_t iload,
 output logic 	    dREN,
 output logic 	    dWEN,
 output logic [1:0] aluSource,
 output logic [3:0] aluOP,
 output logic 	    extendType,
 output logic [1:0] memToReg,
 output logic [1:0] nextPC,
 output logic [1:0] regDest,
 output logic 	    regWrite,
 output logic 	    branch_flag,
 output logic	    halt 	   
);

   always_comb
     begin
	dREN = 0;
	dWEN = 0;
	aluSource = 0;
	memToReg = 1'bX;
	extendType = 0;
	aluOP = 0;
	regWrite = 0;
	nextPC = 0;
	regDest = 0;
	branch_flag = 0;
	halt = 0;
	
	casez (iload[31:26])
	  RTYPE: 
	    begin
	       dREN = 0;
	       dWEN = 0;
	       memToReg = 1;
	       extendType = 0;
	       branch_flag = 0;
	       regDest = 1;

	       casez(iload[5:0])
		 SLL:
		   begin
		      aluSource = 2;
		      aluOP = ALU_SLL;
		      nextPC = 0;
		      regWrite = 1;
		   end
		 SRL:
		   begin
		      aluSource = 2;
		      aluOP = ALU_SRL;
		      nextPC = 0;
		      regWrite = 1;
		   end
		 JR:
		   begin
		      aluSource = 0;
		      aluOP = 0;
		      nextPC = 2;
		      regWrite = 0;
		   end
		 ADDU:
		   begin
		      aluSource = 0;
		      aluOP = ALU_ADD;
		      nextPC = 0;
		      regWrite = 1;
		   end
		 SUBU:
		   begin
		      aluSource = 0;
		      aluOP = ALU_SUB;
		      nextPC = 0;
		      regWrite = 1;
		   end
		 AND:
		   begin
		      aluSource = 0;
		      aluOP = ALU_AND;
		      nextPC = 0;
		      regWrite = 1;
		   end
		 OR:
		   begin
		      aluSource = 0;
		      aluOP = ALU_OR;
		      nextPC = 0;
		      regWrite = 1;
		   end
		 XOR:
		   begin
		      aluSource = 0;
		      aluOP = ALU_XOR;
		      nextPC = 0;
		      regWrite = 1;
		   end
		 NOR:
		   begin
		      aluSource = 0;
		      aluOP = ALU_NOR;
		      nextPC = 0;
		      regWrite = 1;
		   end
		 SLT:
		   begin
		      aluSource = 0;
		      aluOP = ALU_SLT;
		      nextPC = 0;
		      regWrite = 1;
		   end
		 SLTU:
		   begin
		      aluSource = 0;
		      aluOP = ALU_SLTU;
		      nextPC = 0;
		      regWrite = 1;
		   end
	       endcase // casez (iload[5:0]) 
	    end
	  ADDIU: 
	    begin
	       dREN = 0;
	       dWEN = 0;
	       memToReg = 1;
	       extendType = 1;
	       branch_flag = 0;
	       regDest = 0;
	       aluSource = 1;
	       aluOP = ALU_ADD;
	       nextPC = 0;
	       regWrite = 1;
	    end
	  ANDI:
	    begin
	       dREN = 0;
	       dWEN = 0;
	       aluSource = 1;
	       memToReg = 1;
	       extendType = 0;
	       aluOP = ALU_AND;
	       regWrite = 1;
	       nextPC = 0;
	       regDest = 0;
	       branch_flag = 0;
	    end
	  BEQ:
	    begin
	       dREN = 0;
	       dWEN = 0;
	       aluSource = 0;
	       memToReg = 0;
	       extendType = 1;
	       aluOP = ALU_SUB;
	       regWrite = 0;
	       nextPC = 1;
	       regDest = 0;
	       branch_flag = 1;
	    end
	  BNE:
	    begin
	       dREN = 0;
	       dWEN = 0;
	       aluSource = 0;
	       memToReg = 0;
	       extendType = 1;
	       aluOP = ALU_SUB;
	       regWrite = 0;
	       nextPC = 1;
	       regDest = 0;
	       branch_flag = 0;
	    end
	  LUI:
	    begin
	       dREN = 0;
	       dWEN = 0;
	       aluSource = 0;
	       memToReg = 3;
	       extendType = 1;
	       aluOP = 0;
	       regWrite = 1;
	       nextPC = 0;
	       regDest = 0;
	       branch_flag = 0;
	    end 
	  LW:
	    begin
	       dREN = 1;
	       dWEN = 0;
	       aluSource = 1;
	       memToReg = 2;
	       extendType = 1;
	       aluOP = ALU_ADD;
	       regWrite = 1;
	       nextPC = 0;
	       regDest = 0;
	       branch_flag = 0;
	    end
	  ORI:
	    begin
	       dREN = 0;
	       dWEN = 0;
	       aluSource = 1;
	       memToReg = 1;
	       extendType = 0;
	       aluOP = ALU_OR;
	       regWrite = 1;
	       nextPC = 0;
	       regDest = 0;
	       branch_flag = 0;
	    end
	  SLTI:
	    begin
	       dREN = 0;
	       dWEN = 0;
	       aluSource = 1;
	       memToReg = 1;
	       extendType = 1;
	       aluOP = ALU_SLT;
	       regWrite = 1;
	       nextPC = 0;
	       regDest = 0;
	       branch_flag = 0;
	    end
	  SLTIU:
	    begin
	       dREN = 0;
	       dWEN = 0;
	       aluSource = 1;
	       memToReg = 1;
	       extendType = 1;
	       aluOP = ALU_SLTU;
	       regWrite = 1;
	       nextPC = 0;
	       regDest = 0;
	       branch_flag = 0;
	    end
	  SW:
	    begin
	       dREN = 0;
	       dWEN = 1;
	       aluSource = 1;
	       memToReg = 0;
	       extendType = 1;
	       aluOP = ALU_ADD;
	       regWrite = 0;
	       nextPC = 0;
	       regDest = 0;
	       branch_flag = 0;
	    end
	  XORI: 
	    begin
	       dREN = 0;
	       dWEN = 0;
	       aluSource = 1;
	       memToReg = 1;
	       extendType = 0;
	       aluOP = ALU_XOR;
	       regWrite = 1;
	       nextPC = 0;
	       regDest = 0;
	       branch_flag = 0;
	    end
	  J: 
	    begin
	       dREN = 0;
	       dWEN = 0;
	       aluSource = 0;
	       memToReg = 0;
	       extendType = 0;
	       aluOP = 0;
	       regWrite = 0;
	       nextPC = 3;
	       regDest = 0;
	       branch_flag = 0;
	    end
	  JAL: 
	    begin
	       dREN = 0;
	       dWEN = 0;
	       aluSource = 0;
	       memToReg = 0;
	       extendType = 0;
	       aluOP = 0;
	       regWrite = 1;
	       nextPC = 3;
	       regDest = 2;
	       branch_flag = 0;
	    end
	  HALT:
            begin
	       if(iload[5:0] == HALT)
		 begin
		    halt = 1;
		 end
            end
	endcase // casez (iload[31:26])	  
     end
endmodule


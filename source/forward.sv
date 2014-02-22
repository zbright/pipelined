`include "cpu_types_pkg.vh"


module forward (
            input logic [4:0] branchdest_input,
            input logic [4:0] branchdest_ex_mem_output,
            input logic [4:0] branchdest_mem_wb_output,
            input logic [31:0] imemload_id_ex_output,
            input logic regwrite_ex_mem_output,
            input logic regwrite_mem_wb_output,
            input logic [1:0] memtoreg_ex_mem_output,
            input logic [1:0] memtoreg_mem_wb_output,
            output logic [2:0] forwarda,
            output logic [2:0] forwardb
   );



always_comb
    begin
        forwardb = 2'b00;
        forwarda = 2'b00;



        if ((memtoreg_ex_mem_output == 2) && (regwrite_ex_mem_output) && (branchdest_ex_mem_output == imemload_id_ex_output[25:21]) && (branchdest_ex_mem_output != 0)) begin
                forwarda = 3'b011;
        end else if ((memtoreg_mem_wb_output == 2) && ~((regwrite_ex_mem_output) && (branchdest_ex_mem_output == 0)) && (branchdest_ex_mem_output != imemload_id_ex_output[25:21]) && (regwrite_mem_wb_output) && (branchdest_mem_wb_output == imemload_id_ex_output[25:21])) begin
                forwarda = 3'b100;
        end else if ((regwrite_ex_mem_output) && (branchdest_ex_mem_output == imemload_id_ex_output[25:21]) && (branchdest_ex_mem_output != 0)) begin
                forwarda = 3'b001;
        end else if (~((regwrite_ex_mem_output) && (branchdest_ex_mem_output == 0)) && (branchdest_ex_mem_output != imemload_id_ex_output[25:21]) && (regwrite_mem_wb_output) && (branchdest_mem_wb_output == imemload_id_ex_output[25:21])) begin
                forwarda = 3'b010;
        end else begin
                forwarda = 3'b000;
        end


        if ((memtoreg_ex_mem_output == 2) && (regwrite_ex_mem_output) && (branchdest_ex_mem_output == imemload_id_ex_output[20:16]) && (branchdest_ex_mem_output != 0)) begin
                forwardb = 3'b011;
        end else if ((memtoreg_mem_wb_output == 2) && ~((regwrite_ex_mem_output) && (branchdest_ex_mem_output == 0)) && (branchdest_ex_mem_output != imemload_id_ex_output[20:16]) && (regwrite_mem_wb_output) && (branchdest_mem_wb_output == imemload_id_ex_output[20:16])) begin
                forwardb = 3'b100;
        end else if ((regwrite_ex_mem_output) && (branchdest_ex_mem_output == imemload_id_ex_output[20:16]) && (branchdest_ex_mem_output != 0)) begin
                forwardb = 3'b001;
        end else if (~((regwrite_ex_mem_output) && (branchdest_ex_mem_output == 0)) && (branchdest_ex_mem_output != imemload_id_ex_output[20:16]) && (regwrite_mem_wb_output) && (branchdest_mem_wb_output == imemload_id_ex_output[20:16])) begin
                forwardb = 3'b010;
        end else begin
                forwardb = 3'b000;
        end
    end

endmodule
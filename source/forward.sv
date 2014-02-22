`include "cpu_types_pkg.vh"


module forward (
            input logic [4:0] branchdest_input,
            input logic [4:0] branchdest_ex_mem_output,
            input logic [4:0] branchdest_mem_wb_output,
            input logic [31:0] imemload_id_ex_output,
            input logic regwrite_id_ex_output,
            input logic regwrite_ex_mem_output,
            input logic regwrite_mem_wb_output,
            output logic [1:0] forwarda,
            output logic [1:0] forwardb
   );



always_comb
    begin
        forwardb = 2'b00;
        forwarda = 2'b00;
        if ((regwrite_ex_mem_output) && (branchdest_ex_mem_output == imemload_id_ex_output[25:21]) && (branchdest_ex_mem_output != 0)) begin
                forwarda = 2'b01;
        end else if (~((regwrite_ex_mem_output) && (branchdest_ex_mem_output == 0)) && (branchdest_ex_mem_output != imemload_id_ex_output[25:21]) && (regwrite_mem_wb_output) && (branchdest_mem_wb_output == imemload_id_ex_output[25:21])) begin
                forwarda = 2'b10;
        end else begin
                forwarda = 2'b00;
        end

        if ((regwrite_ex_mem_output) && (branchdest_ex_mem_output == imemload_id_ex_output[20:16]) && (branchdest_ex_mem_output != 0)) begin
                forwardb = 2'b01;
        end else if (~((regwrite_ex_mem_output) && (branchdest_ex_mem_output == 0)) && (branchdest_ex_mem_output != imemload_id_ex_output[20:16]) && (regwrite_mem_wb_output) && (branchdest_mem_wb_output == imemload_id_ex_output[20:16])) begin
                forwardb = 2'b10;
        end else begin
                forwardb = 2'b00;
        end
    end

endmodule
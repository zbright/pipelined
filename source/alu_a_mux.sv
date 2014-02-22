`include "cpu_types_pkg.vh"


module alu_a_mux (
            input logic [1:0] forwarda,
            input logic [31:0] rdat_one_id_ex_output,
            input logic [31:0] aluresult_ex_mem_output,
            input logic [31:0] aluresult_mem_wb_output,
            output logic [31:0] alu_a_mux_output
   );

always_comb
    begin
        if (forwarda == 2'b00) begin
            alu_a_mux_output = rdat_one_id_ex_output;
        end else if (forwarda == 2'b01) begin
            alu_a_mux_output = aluresult_ex_mem_output;
        end else if (forwarda == 2'b10) begin
            alu_a_mux_output = aluresult_mem_wb_output;
        end
    end

endmodule
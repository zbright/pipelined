`include "cpu_types_pkg.vh"


module alu_a_mux (
            input logic [2:0] forwarda,
            input logic [31:0] rdat_one_id_ex_output,
            input logic [31:0] aluresult_ex_mem_output,
            input logic [31:0] upper16_ex_mem_output,
            input logic [31:0] writedata_output,
            input logic [31:0] rdat2_ex_mem_output,
            output logic [31:0] alu_a_mux_output
   );

always_comb
    begin
        if (forwarda == 3'b000) begin
            alu_a_mux_output = rdat_one_id_ex_output;
        end else if (forwarda == 3'b001) begin
            alu_a_mux_output = aluresult_ex_mem_output;
        end else if (forwarda == 3'b010) begin
            alu_a_mux_output = writedata_output;
        end else if (forwarda == 3'b011) begin
            alu_a_mux_output = upper16_ex_mem_output;
        end else if (forwarda == 3'b111) begin
            alu_a_mux_output = rdat2_ex_mem_output;
        end else begin
            alu_a_mux_output = rdat_one_id_ex_output;
        end



    end

endmodule
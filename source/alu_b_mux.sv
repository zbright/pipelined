`include "cpu_types_pkg.vh"


module alu_b_mux (
            input logic [1:0] forwardb,
            input logic [31:0] rdat_two_id_ex_output,
            input logic [31:0] aluresult_ex_mem_output,
            input logic [31:0] upper16_ex_mem_output,
            input logic [31:0] writedata_output,
            output logic [31:0] alu_b_mux_output
   );

always_comb
    begin
        if (forwardb == 2'b00) begin
            alu_b_mux_output = rdat_two_id_ex_output;
        end else if (forwardb == 2'b01) begin
            alu_b_mux_output = aluresult_ex_mem_output;
        end else if (forwardb == 2'b10) begin
            alu_b_mux_output = writedata_output;
        end else if (forwardb == 2'b11) begin
            alu_b_mux_output = upper16_ex_mem_output;
        end else begin
            alu_b_mux_output = rdat_two_id_ex_output;
        end
    end

endmodule
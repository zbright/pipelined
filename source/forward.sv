`include "cpu_types_pkg.vh"


module forward (
            input logic [4:0] branchdest_ex_mem,
            input logic [4:0] branchdest_mem_wb,
            input logic [31:0] imemload_id_ex,
            input logic [31:0] imemload_ex_mem,
            input logic regwrite_ex_mem,
            input logic regwrite_mem_wb,
            input logic [1:0] memtoreg_ex_mem,
            input logic dmemWEN,
            output logic [2:0] forwarda,
            output logic [2:0] forwardb
   );



always_comb
    begin
        forwardb = 3'b000;
        forwarda = 3'b000;



        if ((memtoreg_ex_mem == 2) && (regwrite_ex_mem) && (branchdest_ex_mem == imemload_id_ex[25:21]) && (branchdest_ex_mem != 0)) begin
                forwarda = 3'b011;
        end else if ((regwrite_ex_mem) && (branchdest_ex_mem == imemload_id_ex[25:21]) && (branchdest_ex_mem != 0)) begin
                forwarda = 3'b001;
        end else if (~((regwrite_ex_mem) && (branchdest_ex_mem == 0)) && (branchdest_ex_mem != imemload_id_ex[25:21]) && (regwrite_mem_wb) && (branchdest_mem_wb == imemload_id_ex[25:21])) begin
                forwarda = 3'b010;
        end else if ((dmemWEN) && (imemload_ex_mem[20:16] == imemload_id_ex[25:21]) && (branchdest_ex_mem != 0)) begin
                forwarda = 3'b111;
        end else begin
                forwarda = 3'b00;
        end

        if ((memtoreg_ex_mem == 2) && (regwrite_ex_mem) && (branchdest_ex_mem == imemload_id_ex[20:16]) && (branchdest_ex_mem != 0)) begin
                forwardb = 3'b011;
        end else if ((regwrite_ex_mem) && (branchdest_ex_mem == imemload_id_ex[20:16]) && (branchdest_ex_mem != 0)) begin
                forwardb = 3'b001;
        end else if (~((regwrite_ex_mem) && (branchdest_ex_mem == 0)) && (branchdest_ex_mem != imemload_id_ex[20:16]) && (regwrite_mem_wb) && (branchdest_mem_wb == imemload_id_ex[20:16])) begin
                forwardb = 3'b010;
        end else if ((dmemWEN) && (imemload_ex_mem[20:16] == imemload_id_ex[20:16]) && (branchdest_ex_mem != 0)) begin
                forwardb = 3'b111;
        end else begin
                forwardb = 3'b000;
        end
    end

endmodule
`include "datapath_cache_if.vh"

//register interface
`include "cache_control_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module icache(
            input logic CLK,
            input logic nRST,
            datapath_cache_if.icache dcif,
            cache_control_if.icache ccif
            );

    // import types
    import cpu_types_pkg::*;

    //struct declaration
    icachef_t cacheaddress;

    typedef struct packed {
    word_t             data;
    logic [ITAG_W-1:0]  tag;
    logic               valid;
    } icacheblock;

    icacheblock [15:0] cacheblock;

    //declaring values
    logic match;

    assign cacheaddress = icachef_t'(dcif.imemaddr);

    always_ff @(posedge CLK, negedge nRST)
        begin
            if (nRST == 0) begin
                cacheblock <= 0;
            end else if(!match && !ccif.iwait ) begin
                cacheblock[cacheaddress.idx].data <= ccif.iload;
                cacheblock[cacheaddress.idx].tag <= cacheaddress.tag;
                cacheblock[cacheaddress.idx].valid <= '1;
            end
        end

    assign match = (cacheblock[cacheaddress.idx].tag == cacheaddress.tag)
                    && cacheblock[cacheaddress.idx].valid && dcif.imemREN;

    assign dcif.ihit = (!match && !ccif.iwait) || match ? 1 : 0;
    assign dcif.imemload = !match && !ccif.iwait ? ccif.iload :
                match ? cacheblock[cacheaddress.idx].data : 0;

    assign ccif.iREN = !match;
    assign ccif.iaddr = dcif.imemaddr;

endmodule

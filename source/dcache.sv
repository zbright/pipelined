`include "datapath_cache_if.vh"

//register interface
`include "cache_control_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module dcache(
            input logic CLK,
            input logic nRST,
            datapath_cache_if.dcache dcif,
            cache_control_if.dcache ccif
            );

    // import types
    import cpu_types_pkg::*;

    //struct declaration
    dcachef_t cacheaddress;

    typedef struct packed {
    word_t             data_one;
    word_t             data_two;
    logic [ITAG_W-1:0]  tag;
    logic               valid;
    } dcacheblock;

    dcacheblock [7:0] cacheblock;
    dcacheblock        temp_fetch_store;

    //variable declaration
    logic match;

    //assign statements
    assign cacheaddress = dcachef_t'(dcif.dmemaddr);

    assign match = (cacheblock[cacheaddress.idx].tag == cacheaddress.tag)
                    && cacheblock[cacheaddress.idx].valid && (dcif.dmemREN || dcif.dmemWEN);


    typedef enum {IDLE, COMPARE, WRITEBACK_ONE, WRITEBACK_TWO, OVERWRITE, OUTPUT, WRITECACHE, FETCH_ONE, FETCH_TWO, HALT} states;
    states cstate, nstate;


    //state transition
    always_ff @(posedge CLK, negedge nRST)
    begin
        if (!nRST)
            cstate <= IDLE;
        else
            cstate <= nstate;
    end

    //next state logic
    always_comb
    begin
        nstate = IDLE;
        if (cstate == IDLE) begin
            if (dcif.dmemREN || dcif.dmemWEN)
                nstate = COMPARE;
            else if (dcif.halt)
                nstate = HALT;
        end else if (cstate == COMPARE) begin
            if(match)
                nstate = dcif.dmemWEN ? OVERWRITE : OUTPUT;
            else if(!cacheblock[cacheaddress.idx].valid)
                nstate = WRITEBACK_ONE;
            else
                nstate = FETCH_ONE;
        end else if(cstate == WRITEBACK_ONE && !ccif.dwait)
            nstate = WRITEBACK_TWO;
        else if(cstate == WRITEBACK_TWO && !ccif.dwait)
            nstate = FETCH_ONE;
        else if(cstate == FETCH_ONE && !ccif.dwait) begin
            nstate = FETCH_TWO;
            temp_fetch_store.data_one = ccif.dload;
        end else if(cstate == FETCH_TWO && !ccif.dwait) begin
            nstate = WRITECACHE;
            temp_fetch_store.data_two = ccif.dload;
            temp_fetch_store.valid = 1;
            temp_fetch_store.tag = cacheaddress.tag;
        end else if(cstate == WRITECACHE) begin
            cacheblock[cacheaddress.idx] = temp_fetch_store;
            nstate = dcif.dmemWEN ? OVERWRITE : OUTPUT;
        end else if(cstate == OVERWRITE) begin
            if(cacheaddress.blkoff)
                cacheblock[cacheaddress.idx].data_two = dcif.dmemstore;
            else
                cacheblock[cacheaddress.idx].data_one = dcif.dmemstore;

            nstate = IDLE;
        end else if(cstate == OUTPUT)
            nstate = IDLE;
    end

    //output logic
    always_comb
    begin
        dcif.dhit = 0;
        dcif.dmemload = 0;
        //dcif.flushed = 0;
        ccif.dREN = 0;
        ccif.dWEN = 0;
        ccif.daddr = 0;
        ccif.dstore = 0;

        casez(cstate)
            IDLE: begin
            end
            COMPARE: begin
            end
            WRITEBACK_ONE: begin
                ccif.dWEN = 1;
                ccif.daddr = dcif.dmemaddr;
                ccif.dstore = cacheblock[cacheaddress.idx].data_one;
            end
            WRITEBACK_TWO: begin
                ccif.dWEN = 1;
                ccif.daddr = dcif.dmemaddr;
                ccif.dstore = cacheblock[cacheaddress.idx].data_two;
            end
            OVERWRITE: begin
                dcif.dhit = 1;
            end
            OUTPUT: begin
                if(cacheaddress.blkoff)
                    dcif.dmemload = cacheblock[cacheaddress.idx].data_two;
                else
                    dcif.dmemload = cacheblock[cacheaddress.idx].data_one;

                dcif.dhit = 1;
            end
            WRITECACHE: begin
            end
            FETCH_ONE: begin
                ccif.dREN = 1;
                ccif.daddr = dcif.dmemaddr;
            end
            FETCH_TWO: begin
                ccif.dREN = 1;
                ccif.daddr = dcif.dmemaddr;
            end
            HALT: begin
            end
        endcase
    end

    //dcache logic


endmodule

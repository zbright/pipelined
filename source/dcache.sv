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
    logic               dirty;
    logic               recent;
    } dcacheblock;

    dcacheblock [7:0] cacheblock_one = 0;
    dcacheblock [7:0] cacheblock_two = 0;
    dcacheblock        temp_fetch_store = 0;

    //variable declaration
    logic match_one;
    logic match_two;
    logic [4:0] i;

    logic halt = 0;

    //assign statements
    assign cacheaddress = dcachef_t'(dcif.dmemaddr);

    assign match_one = (cacheblock_one[cacheaddress.idx].tag == cacheaddress.tag)
                    && !cacheblock_one[cacheaddress.idx].dirty && (dcif.dmemREN || dcif.dmemWEN);

    assign match_two = (cacheblock_two[cacheaddress.idx].tag == cacheaddress.tag)
                    && !cacheblock_two[cacheaddress.idx].dirty && (dcif.dmemREN || dcif.dmemWEN);


    typedef enum {IDLE, WAITING, COMPARE, WRITEBACK_ONE, WRITEBACK_TWO, OVERWRITE, OUTPUT, WRITECACHE, FETCH_ONE, FETCH_TWO, HALT} states;
    states cstate, nstate;

    //state transition
    always_ff @(posedge CLK, negedge nRST)
    begin
        if(cstate == HALT && ~ccif.dwait)
            i <= i + 1;
        else if (cstate == WAITING)
            i <= 0;

        if (!nRST)
            cstate <= HALT;
        else
            cstate <= nstate;

    end

    //next state logic
    always_comb
    begin
        //nstate = IDLE;
        if (cstate == IDLE) begin
            // cacheblock_one = 0;
            // cacheblock_two = 0;
            // temp_fetch_store = 0;
            nstate = WAITING;
        end else if (dcif.halt)
            nstate = HALT;
        else if (cstate == WAITING) begin
            if (dcif.dmemREN || dcif.dmemWEN)
                nstate = COMPARE;
        end else if (cstate == COMPARE) begin
            if(match_one || match_two)
                nstate = dcif.dmemWEN ? OVERWRITE : OUTPUT;
            else if(cacheblock_one[cacheaddress.idx].dirty || cacheblock_two[cacheaddress.idx].dirty)
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
            temp_fetch_store.dirty = 0;
            temp_fetch_store.tag = cacheaddress.tag;
        end else if(cstate == WRITECACHE) begin
            cacheblock_one[cacheaddress.idx] = temp_fetch_store;
            nstate = dcif.dmemWEN ? OVERWRITE : OUTPUT;
        end else if(cstate == OVERWRITE) begin
            if(match_one) begin
                if (cacheaddress.blkoff)
                    cacheblock_one[cacheaddress.idx].data_two = dcif.dmemstore;
                else
                    cacheblock_one[cacheaddress.idx].data_one = dcif.dmemstore;

                cacheblock_one[cacheaddress.idx].dirty = 1;
                cacheblock_one[cacheaddress.idx].recent = 0;
                cacheblock_two[cacheaddress.idx].recent = 1;
            end else if (match_two) begin
                if (cacheaddress.blkoff)
                    cacheblock_two[cacheaddress.idx].data_two = dcif.dmemstore;
                else
                    cacheblock_two[cacheaddress.idx].data_one = dcif.dmemstore;

                cacheblock_two[cacheaddress.idx].dirty = 1;
                cacheblock_two[cacheaddress.idx].recent = 0;
                cacheblock_one[cacheaddress.idx].recent = 1;
                end
            nstate = WAITING;
        end else if(cstate == OUTPUT)
            nstate = WAITING;
        else if (cstate == HALT && i > 32)
            nstate = WAITING;
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
            WAITING: begin
            end
            COMPARE: begin
            end
            WRITEBACK_ONE: begin
                ccif.dWEN = 1;

                if (!cacheblock_one[cacheaddress.idx].recent) begin
                    ccif.dstore = cacheblock_one[cacheaddress.idx].data_one;
                    ccif.daddr = {cacheblock_one[cacheaddress.idx].tag, cacheaddress.idx, 3'b000};
                end else begin
                    ccif.dstore = cacheblock_two[cacheaddress.idx].data_one;
                    ccif.daddr = {cacheblock_two[cacheaddress.idx].tag, cacheaddress.idx, 3'b000};
                end
            end
            WRITEBACK_TWO: begin
                ccif.dWEN = 1;

                if (!cacheblock_one[cacheaddress.idx].recent) begin
                    ccif.dstore = cacheblock_one[cacheaddress.idx].data_two;
                    ccif.daddr = {cacheblock_one[cacheaddress.idx].tag, cacheaddress.idx, 'b100};
                end else begin
                    ccif.dstore = cacheblock_two[cacheaddress.idx].data_two;
                    ccif.daddr = {cacheblock_two[cacheaddress.idx].tag, cacheaddress.idx, 3'b100};
                end
            end
            OVERWRITE: begin
                dcif.dhit = 1;
            end
            OUTPUT: begin
                if(cacheaddress.blkoff && match_one)
                    dcif.dmemload = cacheblock_one[cacheaddress.idx].data_two;
                else if (!cacheaddress.blkoff && match_one)
                    dcif.dmemload = cacheblock_one[cacheaddress.idx].data_one;
                else if (cacheaddress.blkoff && match_two)
                    dcif.dmemload = cacheblock_two[cacheaddress.idx].data_two;
                else if (!cacheaddress.blkoff && match_two)
                    dcif.dmemload = cacheblock_two[cacheaddress.idx].data_one;
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
                ccif.daddr = dcif.dmemaddr + 4;
            end
            HALT: begin

                if(cacheblock_one != 0 && cacheblock_two != 0) begin
                    ccif.dWEN = 1;

                    // if(!ccif.dwait) begin
                        if(i < 8) begin //cacheblock 1 word 1
                            if(cacheblock_one[i].dirty) begin
                                ccif.dstore = cacheblock_one[i].data_one;
                                ccif.daddr = {cacheblock_one[i].tag, i, 3'b000};
                            end
                        end else if(i < 16) begin //cache block 1 word 2
                            if(cacheblock_one[i-8].dirty) begin
                                ccif.dstore = cacheblock_one[i-8].data_two;
                                ccif.daddr = {cacheblock_one[i-8].tag, i, 3'b000};
                            end
                        end else if(i < 24) begin //cacheblock 2 word 1
                            if(cacheblock_two[i-16].dirty) begin
                                ccif.dstore = cacheblock_two[i-16].data_one;
                                ccif.daddr = {cacheblock_two[i-16].tag, i, 3'b000};
                            end
                        end else if(i < 32) begin //cache bloack 2 word 2
                            if(cacheblock_two[i-24].dirty) begin
                                ccif.dstore = cacheblock_two[i-24].data_two;
                                ccif.daddr = {cacheblock_two[i-24].tag, i, 3'b000};
                            end

                        end
                    // end
                end
            end
        endcase
    end

    //dcache logic


endmodule

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
    logic               valid;
    logic               recent;
    } dcacheblock;

    dcacheblock [7:0] cacheblock_one;
    dcacheblock [7:0] cacheblock_two;
    dcacheblock [7:0] cacheblock_one_next;
    dcacheblock [7:0] cacheblock_two_next;
    dcacheblock        temp_fetch_store;
    dcacheblock        temp_fetch_store_next;

    //variable declaration
    logic match_one;
    logic match_two;
    logic [5:0] i;
    logic [31:0] hit_count;
    logic [31:0] next_hit_count;
    logic flag;
    logic flag_next;

    //assign statements
    assign cacheaddress = dcachef_t'(dcif.dmemaddr);

    assign match_one = (cacheblock_one_next[cacheaddress.idx].tag == cacheaddress.tag)
                    && (dcif.dmemREN || dcif.dmemWEN) && cacheblock_one_next[cacheaddress.idx].valid;

    assign match_two = (cacheblock_two_next[cacheaddress.idx].tag == cacheaddress.tag)
                    && (dcif.dmemREN || dcif.dmemWEN) && cacheblock_two_next[cacheaddress.idx].valid;


    typedef enum {IDLE, WRITEBACK_ONE, WRITEBACK_TWO, OVERWRITE, FETCH_ONE, FETCH_TWO, HALT} states;
    states cstate, nstate;

    //state transition
    always_ff @(posedge CLK, negedge nRST)
    begin
        if (!nRST)
            cstate <= IDLE;
        else
            cstate <= nstate;

        if(!nRST)
            i <= 0;
        else if(cstate == HALT && (ccif.dwait != ccif.dWEN))
            i <= i + 1'b1;

    end

    always_ff @(posedge CLK, negedge nRST)
    begin
        if(!nRST) begin
            cacheblock_one <= 0;
            cacheblock_two <= 0;
            temp_fetch_store <= 0;
            hit_count <= 0;
            flag <= 0;
        end else begin
            cacheblock_one <= cacheblock_one_next;
            cacheblock_two <= cacheblock_two_next;

            hit_count <= next_hit_count;

            temp_fetch_store <= temp_fetch_store_next;
            flag <= flag_next;
        end
    end

    //next state logic
    always_comb
    begin
        dcif.dhit = 0;
        dcif.dmemload = 0;
        nstate = cstate;
        next_hit_count = hit_count;
        flag_next = flag;

        cacheblock_two_next = cacheblock_two;
        cacheblock_one_next = cacheblock_one;
        temp_fetch_store_next = temp_fetch_store;

        if (cstate == IDLE && i == 0) begin
            if (dcif.halt)
                nstate = HALT;
            else if (dcif.dmemREN || dcif.dmemWEN) begin
                if(temp_fetch_store != 0) begin
                    if(!cacheblock_one[cacheaddress.idx].recent) begin
                        cacheblock_one_next[cacheaddress.idx] = temp_fetch_store;
                        cacheblock_two_next[cacheaddress.idx].recent = 0;
                    end else begin
                        cacheblock_two_next[cacheaddress.idx] = temp_fetch_store;
                        cacheblock_one_next[cacheaddress.idx].recent = 0;
                    end

                    if(dcif.dmemWEN)
                        nstate = OVERWRITE;
                    else begin
                        flag_next = 1;
                        temp_fetch_store_next = 0;

                        if(cacheaddress.blkoff && match_one)
                            dcif.dmemload = cacheblock_one_next[cacheaddress.idx].data_two;
                        else if (!cacheaddress.blkoff && match_one)
                            dcif.dmemload = cacheblock_one_next[cacheaddress.idx].data_one;
                        else if (cacheaddress.blkoff && match_two)
                            dcif.dmemload = cacheblock_two_next[cacheaddress.idx].data_two;
                        else if (!cacheaddress.blkoff && match_two)
                            dcif.dmemload = cacheblock_two_next[cacheaddress.idx].data_one;
                        dcif.dhit = 1;
                    end
                end else if(match_one || match_two) begin
                    next_hit_count = hit_count + 1'b1;
                    if(dcif.dmemWEN)
                        nstate = OVERWRITE;
                    else begin
                        flag_next = 1;
                        temp_fetch_store_next = 0;

                        if(cacheaddress.blkoff && match_one)
                            dcif.dmemload = cacheblock_one_next[cacheaddress.idx].data_two;
                        else if (!cacheaddress.blkoff && match_one)
                            dcif.dmemload = cacheblock_one_next[cacheaddress.idx].data_one;
                        else if (cacheaddress.blkoff && match_two)
                            dcif.dmemload = cacheblock_two_next[cacheaddress.idx].data_two;
                        else if (!cacheaddress.blkoff && match_two)
                            dcif.dmemload = cacheblock_two_next[cacheaddress.idx].data_one;
                        dcif.dhit = 1;
                    end
                end else if((cacheblock_one[cacheaddress.idx].valid && cacheblock_one[cacheaddress.idx].dirty) || (cacheblock_two[cacheaddress.idx].valid && cacheblock_two[cacheaddress.idx].dirty))
                    nstate = WRITEBACK_ONE;
                else
                    nstate = FETCH_ONE;
            end
        end else if(cstate == WRITEBACK_ONE && !ccif.dwait)
            nstate = WRITEBACK_TWO;
        else if(cstate == WRITEBACK_TWO && !ccif.dwait)
            nstate = FETCH_ONE;
        else if(cstate == FETCH_ONE && !ccif.dwait) begin
            flag_next = 0;
            nstate = FETCH_TWO;
            temp_fetch_store_next.data_one = ccif.dload;
        end else if(cstate == FETCH_TWO && !ccif.dwait) begin
            nstate = IDLE;
            flag_next = 0;
            temp_fetch_store_next.data_two = ccif.dload;
            temp_fetch_store_next.dirty = 0;
            temp_fetch_store_next.recent = 1;
            temp_fetch_store_next.valid = 1;
            temp_fetch_store_next.tag = cacheaddress.tag;
        end else if(cstate == OVERWRITE) begin
            temp_fetch_store_next = 0;
            flag_next = 1;

            if(match_one) begin
                if (cacheaddress.blkoff) begin
                    cacheblock_one_next[cacheaddress.idx].data_two = dcif.dmemstore;
                    cacheblock_one_next[cacheaddress.idx].data_one = cacheblock_one[cacheaddress.idx].data_one;
                end else begin
                    cacheblock_one_next[cacheaddress.idx].data_one = dcif.dmemstore;
                    cacheblock_one_next[cacheaddress.idx].data_two = cacheblock_one[cacheaddress.idx].data_two;
                end

                cacheblock_one_next[cacheaddress.idx].dirty = 1;
                cacheblock_one_next[cacheaddress.idx].recent = 0;
                cacheblock_two_next[cacheaddress.idx].recent = 1;
            end else if (match_two) begin
                if (cacheaddress.blkoff) begin
                    cacheblock_two_next[cacheaddress.idx].data_two = dcif.dmemstore;
                    cacheblock_two_next[cacheaddress.idx].data_one = cacheblock_two[cacheaddress.idx].data_one;
                end else begin
                    cacheblock_two_next[cacheaddress.idx].data_one = dcif.dmemstore;
                    cacheblock_two_next[cacheaddress.idx].data_two = cacheblock_two[cacheaddress.idx].data_two;
                end

                cacheblock_two_next[cacheaddress.idx].dirty = 1;
                cacheblock_two_next[cacheaddress.idx].recent = 0;
                cacheblock_one_next[cacheaddress.idx].recent = 1;
                end
            nstate = IDLE;
            dcif.dhit = 1;

        end
    end

    //output logic
    always_comb
    begin
        // dcif.dhit = 0;
        // dcif.dmemload = 0;
        dcif.flushed = 0;
        ccif.dREN = 0;
        ccif.dWEN = 0;
        ccif.daddr = 0;
        ccif.dstore = 0;

        casez(cstate)
            IDLE: begin

                // if((temp_fetch_store != 0 || match_one || match_two) && flag_next == 1 && dcif.dmemREN) begin
                // //if((temp_fetch_store != 0 || match_one || match_two) && flag_next == 1 && dcif.dmemREN) begin
                //     if(cacheaddress.blkoff && match_one)
                //         dcif.dmemload = cacheblock_one_next[cacheaddress.idx].data_two;
                //     else if (!cacheaddress.blkoff && match_one)
                //         dcif.dmemload = cacheblock_one_next[cacheaddress.idx].data_one;
                //     else if (cacheaddress.blkoff && match_two)
                //         dcif.dmemload = cacheblock_two_next[cacheaddress.idx].data_two;
                //     else if (!cacheaddress.blkoff && match_two)
                //         dcif.dmemload = cacheblock_two_next[cacheaddress.idx].data_one;
                //     dcif.dhit = 1;
                //end
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
                    ccif.daddr = {cacheblock_one[cacheaddress.idx].tag, cacheaddress.idx, 3'b100};
                end else begin
                    ccif.dstore = cacheblock_two[cacheaddress.idx].data_two;
                    ccif.daddr = {cacheblock_two[cacheaddress.idx].tag, cacheaddress.idx, 3'b100};
                end
            end
            OVERWRITE: begin
                // dcif.dhit = 1;
            end
            FETCH_ONE: begin
                ccif.dREN = 1;
                ccif.daddr = {cacheaddress.tag, cacheaddress.idx, 1'b0, cacheaddress.bytoff};
            end
            FETCH_TWO: begin
                ccif.dREN = 1;
                ccif.daddr = {cacheaddress.tag, cacheaddress.idx, 1'b1, cacheaddress.bytoff};
            end
            HALT: begin
                    ccif.dWEN = 1;
                    if(i < 6'b001000) begin //cacheblock 1 word 1
                        if(cacheblock_one[i].valid && cacheblock_one[i].dirty) begin
                            ccif.dstore = cacheblock_one[i].data_one;
                            ccif.daddr = {cacheblock_one[i].tag, i[2:0], 3'b000};
                        end else
                            ccif.dWEN = 0;
                    end else if(i < 6'b010000) begin //cache block 1 word 2
                        if(cacheblock_one[i-8].valid && cacheblock_one[i-8].dirty) begin
                            ccif.dstore = cacheblock_one[i-8].data_two;
                            ccif.daddr = {cacheblock_one[i-8].tag, i[2:0], 3'b100};
                        end else
                            ccif.dWEN = 0;
                    end else if(i < 6'b011000) begin //cacheblock 2 word 1
                        if(cacheblock_two[i-16].valid && cacheblock_two[i-16].dirty) begin
                            ccif.dstore = cacheblock_two[i-16].data_one;
                            ccif.daddr = {cacheblock_two[i-16].tag, i[2:0], 3'b000};
                        end else
                            ccif.dWEN = 0;
                    end else if(i < 6'b100000) begin //cache bloack 2 word 2
                        if(cacheblock_two[i-24].valid && cacheblock_two[i-24].dirty) begin
                            ccif.dstore = cacheblock_two[i-24].data_two;
                            ccif.daddr = {cacheblock_two[i-24].tag, i[2:0], 3'b100};
                        end else
                            ccif.dWEN = 0;
                    end else if(i == 6'b100000) begin
                        ccif.dstore = hit_count;
                        ccif.daddr = 32'b000000000000000011000100000000;
                    end else
                            dcif.flushed = 1;
                end
        endcase
    end

endmodule

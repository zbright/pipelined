onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramREN
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramWEN
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramaddr
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramstore
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramload
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramstate
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/memREN
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/memWEN
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/memaddr
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/memstore
add wave -noupdate /system_tb/DUT/CPU/CC/ccif/dwait
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/dload
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate -group CCIF -expand /system_tb/DUT/CPU/ccif/ccwrite
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ccwait
add wave -noupdate -group CCIF -expand /system_tb/DUT/CPU/ccif/cctrans
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ccsnoopaddr
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ccinv
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -group CCIF /system_tb/DUT/CPU/ccif/ramload
add wave -noupdate -group {DCIF 0} /system_tb/DUT/CPU/dcif0/halt
add wave -noupdate -group {DCIF 0} /system_tb/DUT/CPU/dcif0/ihit
add wave -noupdate -group {DCIF 0} /system_tb/DUT/CPU/dcif0/imemREN
add wave -noupdate -group {DCIF 0} /system_tb/DUT/CPU/dcif0/imemload
add wave -noupdate -group {DCIF 0} /system_tb/DUT/CPU/dcif0/imemaddr
add wave -noupdate -group {DCIF 0} /system_tb/DUT/CPU/dcif0/dhit
add wave -noupdate -group {DCIF 0} /system_tb/DUT/CPU/dcif0/datomic
add wave -noupdate -group {DCIF 0} /system_tb/DUT/CPU/dcif0/dmemREN
add wave -noupdate -group {DCIF 0} /system_tb/DUT/CPU/dcif0/dmemWEN
add wave -noupdate -group {DCIF 0} /system_tb/DUT/CPU/dcif0/flushed
add wave -noupdate -group {DCIF 0} /system_tb/DUT/CPU/dcif0/dmemload
add wave -noupdate -group {DCIF 0} /system_tb/DUT/CPU/dcif0/dmemstore
add wave -noupdate -group {DCIF 0} /system_tb/DUT/CPU/dcif0/dmemaddr
add wave -noupdate -group {Register 0} /system_tb/DUT/CPU/DP0/REGISTER/CLK
add wave -noupdate -group {Register 0} /system_tb/DUT/CPU/DP0/REGISTER/nRST
add wave -noupdate -group {Register 0} /system_tb/DUT/CPU/DP0/REGISTER/storeregister
add wave -noupdate -group {iCache 0} /system_tb/DUT/CPU/CM0/ICACHE/CLK
add wave -noupdate -group {iCache 0} /system_tb/DUT/CPU/CM0/ICACHE/nRST
add wave -noupdate -group {iCache 0} /system_tb/DUT/CPU/CM0/ICACHE/cacheaddress
add wave -noupdate -group {iCache 0} -expand /system_tb/DUT/CPU/CM0/ICACHE/cacheblock
add wave -noupdate -group {iCache 0} /system_tb/DUT/CPU/CM0/ICACHE/match
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/CLK
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/nRST
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/halted
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/flushed
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/next_evict
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/evict
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/linkregister
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/next_linkregister
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/link_valid
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/next_link_valid
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/snoop_link_hit
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/cacheaddress
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/cacheblock_one
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/cacheblock_two
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/temp_fetch_store
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/temp_fetch_store_next
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/match_one
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/match_two
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/i
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/hit_count
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/next_hit_count
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/flag
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/flag_next
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/snoop_hit_2
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/snoop_hit_1
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/snoop_addr
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/cstate
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/nstate
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/cacheblock_one_next
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/cacheblock_two_next
add wave -noupdate -group {DCIF 1} /system_tb/DUT/CPU/dcif1/halt
add wave -noupdate -group {DCIF 1} /system_tb/DUT/CPU/dcif1/ihit
add wave -noupdate -group {DCIF 1} /system_tb/DUT/CPU/dcif1/imemREN
add wave -noupdate -group {DCIF 1} /system_tb/DUT/CPU/dcif1/imemload
add wave -noupdate -group {DCIF 1} /system_tb/DUT/CPU/dcif1/imemaddr
add wave -noupdate -group {DCIF 1} /system_tb/DUT/CPU/dcif1/dhit
add wave -noupdate -group {DCIF 1} /system_tb/DUT/CPU/dcif1/datomic
add wave -noupdate -group {DCIF 1} /system_tb/DUT/CPU/dcif1/dmemREN
add wave -noupdate -group {DCIF 1} /system_tb/DUT/CPU/dcif1/dmemWEN
add wave -noupdate -group {DCIF 1} /system_tb/DUT/CPU/dcif1/flushed
add wave -noupdate -group {DCIF 1} /system_tb/DUT/CPU/dcif1/dmemload
add wave -noupdate -group {DCIF 1} /system_tb/DUT/CPU/dcif1/dmemstore
add wave -noupdate -group {DCIF 1} /system_tb/DUT/CPU/dcif1/dmemaddr
add wave -noupdate -group {Register 1} /system_tb/DUT/CPU/DP1/REGISTER/CLK
add wave -noupdate -group {Register 1} /system_tb/DUT/CPU/DP1/REGISTER/nRST
add wave -noupdate -group {Register 1} -expand /system_tb/DUT/CPU/DP1/REGISTER/storeregister
add wave -noupdate -group {iCache 1} /system_tb/DUT/CPU/CM1/ICACHE/CLK
add wave -noupdate -group {iCache 1} /system_tb/DUT/CPU/CM1/ICACHE/nRST
add wave -noupdate -group {iCache 1} /system_tb/DUT/CPU/CM1/ICACHE/cacheaddress
add wave -noupdate -group {iCache 1} -expand /system_tb/DUT/CPU/CM1/ICACHE/cacheblock
add wave -noupdate -group {iCache 1} /system_tb/DUT/CPU/CM1/ICACHE/match
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/CLK
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/nRST
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/halted
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/flushed
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/next_evict
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/evict
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/linkregister
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/next_linkregister
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/link_valid
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/next_link_valid
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/snoop_link_hit
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/cacheaddress
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/cacheblock_one
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/cacheblock_two
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/cacheblock_one_next
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/cacheblock_two_next
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/temp_fetch_store
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/temp_fetch_store_next
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/match_one
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/match_two
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/i
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/hit_count
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/next_hit_count
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/flag
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/flag_next
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/snoop_hit_2
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/snoop_hit_1
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/snoop_addr
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/cstate
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/nstate
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/cstate
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/nstate
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/active_core
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/next_active_core
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/evict1
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/evict0
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/halted1
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/halted0
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/flushed1
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/flushed0
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/ccdataready
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/ccdataready_next
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/ccmemtransfer
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/ccmemtransfer_next
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/active
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/next_active
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/ALUsrc
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/memtoreg
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/ALUop
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/regwrite
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/pcselect
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/regdst
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/branch
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/request_dmemREN
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/request_dmemWEN
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/halt_out
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/NPC
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/rdat_one
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/rdat_two
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/imemload
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/uppersixteen
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/signzerovalue
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/wen
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/flush
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/dhit
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/datomic
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/datomic_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/ALUsrc_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/memtoreg_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/ALUop_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/regwrite_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/pcselect_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/regdst_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/branch_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/request_dmemREN_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/request_dmemWEN_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/halt_out_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/NPC_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/rdat_one_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/rdat_two_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/imemload_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/uppersixteen_id_ex_output
add wave -noupdate -group IDEX /system_tb/DUT/CPU/DP1/IDEX/signzerovalue_id_ex_output
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/memtoreg_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/iMemLoad
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/regwrite_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/pcselect_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/branchSelect_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/dmemREN_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/dmemWEN_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/halt_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/rdat1_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/rdat2_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/npc_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/zeroFlag_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/aluResult_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/branchDest_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/upper16_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/signZero_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/iMemLoad_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/dhit
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/datomic_in
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/flush
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/wen
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/memtoreg
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/regwrite
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/pcselect
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/branchSelect
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/dmemREN
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/dmemWEN
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/halt_out
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/rdat1
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/rdat2
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/npc
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/zeroFlag
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/aluResult
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/branchDest
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/upper16
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/signZero
add wave -noupdate -group EXMEM1 /system_tb/DUT/CPU/DP1/EXMEM/datomic
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/memtoreg_in
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/pcselect_in
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/regwrite_in
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/npc_in
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/aluResult_in
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/branchDest_in
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/upper16_in
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/dMemLoad_in
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/imemload_in
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/wen
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/memtoreg
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/regwrite
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/pcselect
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/npc
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/aluResult
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/branchDest
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/upper16
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/dMemLoad
add wave -noupdate -group MEMWB /system_tb/DUT/CPU/DP1/MEMWB/imemload
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate /system_tb/DUT/CPU/CLK
add wave -noupdate -expand -group EXMEM0 -expand /system_tb/DUT/CPU/DP0/EXMEM/iMemLoad
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/CLK
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/nRST
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/memtoreg_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/regwrite_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/pcselect_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/branchSelect_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/dmemREN_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/dmemWEN_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/halt_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/rdat1_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/rdat2_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/npc_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/zeroFlag_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/aluResult_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/branchDest_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/upper16_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/signZero_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/iMemLoad_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/dhit
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/datomic_in
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/flush
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/wen
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/memtoreg
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/regwrite
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/pcselect
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/branchSelect
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/dmemREN
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/dmemWEN
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/halt_out
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/rdat1
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/rdat2
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/npc
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/zeroFlag
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/aluResult
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/branchDest
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/upper16
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/signZero
add wave -noupdate -expand -group EXMEM0 /system_tb/DUT/CPU/DP0/EXMEM/datomic
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {187239 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 179
configure wave -valuecolwidth 106
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {2642144 ps}

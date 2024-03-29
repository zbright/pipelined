onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/branchdest_ex_mem_output
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/branchdest_mem_wb_output
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/imemload_id_ex_output
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/regwrite_ex_mem_output
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/regwrite_mem_wb_output
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/forwarda
add wave -noupdate -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/forwardb
add wave -noupdate -group {ALU A Mux} /system_tb/DUT/CPU/DP/ALUAMUX/forwarda
add wave -noupdate -group {ALU A Mux} /system_tb/DUT/CPU/DP/ALUAMUX/rdat_one_id_ex_output
add wave -noupdate -group {ALU A Mux} /system_tb/DUT/CPU/DP/ALUAMUX/aluresult_ex_mem_output
add wave -noupdate -group {ALU A Mux} /system_tb/DUT/CPU/DP/ALUAMUX/alu_a_mux_output
add wave -noupdate -group {ALU B Mux} /system_tb/DUT/CPU/DP/ALUBMUX/forwardb
add wave -noupdate -group {ALU B Mux} /system_tb/DUT/CPU/DP/ALUBMUX/rdat_two_id_ex_output
add wave -noupdate -group {ALU B Mux} /system_tb/DUT/CPU/DP/ALUBMUX/aluresult_ex_mem_output
add wave -noupdate -group {ALU B Mux} /system_tb/DUT/CPU/DP/ALUBMUX/alu_b_mux_output
add wave -noupdate -expand -group DPIF /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -expand -group DPIF /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -expand -group DPIF /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -expand -group DPIF /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -expand -group DPIF /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -expand -group DPIF /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate -expand -group DPIF /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -expand -group DPIF /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -expand -group DPIF /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -expand -group DPIF /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -expand -group DPIF /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -expand -group DPIF /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/wsel
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/wdat
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/rsel2
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/rsel1
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/rdat2
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/rdat1
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/WEN
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/REGISTER/storeregister
add wave -noupdate -expand -group PC -radix decimal /system_tb/DUT/CPU/DP/PC/pccount
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP/PC/next_pc_count
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP/PC/current_pc_count
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/NPC
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/imemload
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/npc_if_id_output
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/imemload_if_id_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/ALUsrc_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/memtoreg_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/ALUop_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/regwrite_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/pcselect_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/regdst_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/branch_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/request_dmemREN_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/request_dmemWEN_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/halt_out_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/NPC_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/rdat_one_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/rdat_two_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/imemload_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/uppersixteen_id_ex_output
add wave -noupdate -expand -group ID_EX /system_tb/DUT/CPU/DP/IDEX/signzerovalue_id_ex_output
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/memtoreg
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/regwrite
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/pcselect
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/branchSelect
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/dmemWEN_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/dmemREN_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/dmemREN
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/dmemWEN
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/halt_out
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/rdat1
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/rdat2
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/npc
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/zeroFlag
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/aluResult
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/branchDest
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/upper16
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/signZero
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/iMemLoad
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/memtoreg
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/regwrite
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/pcselect
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/npc
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/aluResult
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/branchDest
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/upper16
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/dMemLoad
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/zero_flag
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/use_after_load
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/pc_wen
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/mem_wb_wen
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/jump_flush
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/imemload
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/ihit
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/if_id_wen
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/if_id_rt
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/if_id_rs
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/if_id_flush
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/id_ex_wen
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/id_ex_rt
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/id_ex_flush
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/id_ex_dmemren
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/halt
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/flush
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/ex_mem_wen
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/ex_mem_flush
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/dmemWEN
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/dmemREN
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/dhit
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/data_stall
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/branch_flush
add wave -noupdate -expand -group HAZARD /system_tb/DUT/CPU/DP/HAZARDUNIT/branch_flag
add wave -noupdate -expand -group RAM /system_tb/DUT/RAM/ramif/ramREN
add wave -noupdate -expand -group RAM /system_tb/DUT/RAM/ramif/ramWEN
add wave -noupdate -expand -group RAM /system_tb/DUT/RAM/ramif/ramaddr
add wave -noupdate -expand -group RAM /system_tb/DUT/RAM/ramif/ramstore
add wave -noupdate -expand -group RAM /system_tb/DUT/RAM/ramif/ramload
add wave -noupdate -expand -group RAM /system_tb/DUT/RAM/ramif/ramstate
add wave -noupdate -expand -group RAM /system_tb/DUT/RAM/ramif/memREN
add wave -noupdate -expand -group RAM /system_tb/DUT/RAM/ramif/memWEN
add wave -noupdate -expand -group RAM /system_tb/DUT/RAM/ramif/memaddr
add wave -noupdate -expand -group RAM /system_tb/DUT/RAM/ramif/memstore
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {919319 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 186
configure wave -valuecolwidth 69
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
WaveRestoreZoom {684210 ps} {1330210 ps}

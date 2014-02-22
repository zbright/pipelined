onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -expand -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/branchdest_input
add wave -noupdate -expand -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/branchdest_ex_mem_output
add wave -noupdate -expand -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/branchdest_mem_wb_output
add wave -noupdate -expand -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/imemload_id_ex_output
add wave -noupdate -expand -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/regwrite_id_ex_output
add wave -noupdate -expand -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/regwrite_ex_mem_output
add wave -noupdate -expand -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/regwrite_mem_wb_output
add wave -noupdate -expand -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/forwarda
add wave -noupdate -expand -group {Forward Unit} /system_tb/DUT/CPU/DP/FORWADUNIT/forwardb
add wave -noupdate -expand -group {ALU A Mux} /system_tb/DUT/CPU/DP/ALUAMUX/forwarda
add wave -noupdate -expand -group {ALU A Mux} /system_tb/DUT/CPU/DP/ALUAMUX/rdat_one_id_ex_output
add wave -noupdate -expand -group {ALU A Mux} /system_tb/DUT/CPU/DP/ALUAMUX/aluresult_ex_mem_output
add wave -noupdate -expand -group {ALU A Mux} /system_tb/DUT/CPU/DP/ALUAMUX/aluresult_mem_wb_output
add wave -noupdate -expand -group {ALU A Mux} /system_tb/DUT/CPU/DP/ALUAMUX/alu_a_mux_output
add wave -noupdate -expand -group {ALU B Mux} /system_tb/DUT/CPU/DP/ALUBMUX/forwardb
add wave -noupdate -expand -group {ALU B Mux} /system_tb/DUT/CPU/DP/ALUBMUX/rdat_two_id_ex_output
add wave -noupdate -expand -group {ALU B Mux} /system_tb/DUT/CPU/DP/ALUBMUX/aluresult_ex_mem_output
add wave -noupdate -expand -group {ALU B Mux} /system_tb/DUT/CPU/DP/ALUBMUX/aluresult_mem_wb_output
add wave -noupdate -expand -group {ALU B Mux} /system_tb/DUT/CPU/DP/ALUBMUX/alu_b_mux_output
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
add wave -noupdate -expand -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/wsel
add wave -noupdate -expand -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/wdat
add wave -noupdate -expand -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/rsel2
add wave -noupdate -expand -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/rsel1
add wave -noupdate -expand -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/rdat2
add wave -noupdate -expand -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/rdat1
add wave -noupdate -expand -group Register /system_tb/DUT/CPU/DP/REGISTER/registerval/WEN
add wave -noupdate -expand -group Register /system_tb/DUT/CPU/DP/REGISTER/storeregister
add wave -noupdate -expand -group PC -radix decimal /system_tb/DUT/CPU/DP/PC/pccount
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP/PC/next_pc_count
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP/PC/stall
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP/PC/current_pc_count
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/NPC
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/imemload
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/stall
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/npc_if_id_output
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/imemload_if_id_output
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/temp_NPC_output
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/temp_imemload_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/stall
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/ALUsrc_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/memtoreg_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/ALUop_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/regwrite_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/pcselect_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/regdst_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/branch_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/request_dmemREN_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/request_dmemWEN_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/halt_out_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/NPC_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/rdat_one_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/rdat_two_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/imemload_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/uppersixteen_id_ex_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/signzerovalue_id_ex_output
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/memtoreg
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/regwrite
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/pcselect
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/branchSelect
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/dmemWEN_in
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/dmemREN_in
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/dmemREN
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/dmemWEN
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/halt_out
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/rdat1
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/rdat2
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/npc
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/zeroFlag
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/aluResult
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/branchDest
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/upper16
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/signZero
add wave -noupdate -expand -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/iMemLoad
add wave -noupdate -expand -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/memtoreg
add wave -noupdate -expand -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/regwrite
add wave -noupdate -expand -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/pcselect
add wave -noupdate -expand -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/npc
add wave -noupdate -expand -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/aluResult
add wave -noupdate -expand -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/branchDest
add wave -noupdate -expand -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/upper16
add wave -noupdate -expand -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/dMemLoad
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {430000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 186
configure wave -valuecolwidth 272
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
WaveRestoreZoom {0 ps} {1050 ns}

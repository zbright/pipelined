onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
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
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP/PC/ihit
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP/PC/halt
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP/PC/next_pc_count
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP/PC/stall
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP/PC/current_pc_count
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/NPC
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/imemload
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/ihit
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/stall
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/npc_if_id_output
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/imemload_if_id_output
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/temp_NPC_output
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/temp_imemload_output
add wave -noupdate -expand -group IF_ID /system_tb/DUT/CPU/DP/IFID/NPC_if_id_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/CLK
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/nRST
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/ALUsrc
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/memtoreg
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/ALUop
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/regwrite
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/pcselect
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/regdst
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/branch
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/request_dmemREN
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/request_dmemWEN
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/halt_out
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/NPC
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/rdat_one
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/rdat_two
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/imemload
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/uppersixteen
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/signzerovalue
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
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_ALUsrc_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_memtoreg_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_ALUop_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_regwrite_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_pcselect_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_regdst_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_branch_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_request_dmemREN_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_request_dmemWEN_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_halt_out_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_NPC_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_rdat_one_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_rdat_two_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_imemload_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_uppersixteen_output
add wave -noupdate -group ID_EX /system_tb/DUT/CPU/DP/IDEX/temp_signzerovalue_output
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/CLK
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/nRST
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/memtoreg_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/regwrite_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/pcselect_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/branchSelect_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/dmemREN_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/dmemWEN_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/halt_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/rdat1_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/rdat2_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/npc_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/zeroFlag_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/aluResult_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/branchDest_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/upper16_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/signZero_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/iMemLoad_in
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/dhit
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/memtoreg
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/regwrite
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/pcselect
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/branchSelect
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
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/stall
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_memtoreg
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_regwrite
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_pcselect
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_branchSelect
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_dmemREN
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_dmemWEN
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_halt_out
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_rdat1
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_rdat2
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_npc
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_zeroFlag
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_aluResult
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_branchDest
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_upper16
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_signZero
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_iMemLoad
add wave -noupdate -group EX_MEM /system_tb/DUT/CPU/DP/EXMEM/temp_stall
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/CLK
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/nRST
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/memtoreg_in
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/pcselect_in
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/regwrite_in
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/npc_in
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/aluResult_in
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/branchDest_in
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/upper16_in
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/dMemLoad_in
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/memtoreg
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/regwrite
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/pcselect
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/npc
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/aluResult
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/branchDest
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/upper16
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/dMemLoad
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/temp_memtoreg
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/temp_regwrite
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/temp_pcselect
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/temp_npc
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/temp_aluResult
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/temp_branchDest
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/temp_upper16
add wave -noupdate -group MEM_WB /system_tb/DUT/CPU/DP/MEMWB/temp_dMemLoad
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100000 ps} 0}
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

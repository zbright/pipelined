onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -radix binary /system_tb/DUT/CPU/dcif/imemload
add wave -noupdate -radix binary /system_tb/DUT/CPU/DP/IFID/imemload_if_id_output
add wave -noupdate /system_tb/DUT/CPU/DP/MEMWB/regwrite
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/A
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/B
add wave -noupdate -radix binary /system_tb/DUT/CPU/DP/ALU/OPCODE
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/OUTPUT
add wave -noupdate -divider {Control Block}
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/request_dmemREN
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/request_dmemWEN
add wave -noupdate -divider IDEX
add wave -noupdate /system_tb/DUT/CPU/DP/IDEX/request_dmemREN_id_ex_output
add wave -noupdate /system_tb/DUT/CPU/DP/IDEX/request_dmemWEN_id_ex_output
add wave -noupdate -divider {EX MEM}
add wave -noupdate /system_tb/DUT/CPU/DP/EXMEM/dmemREN
add wave -noupdate /system_tb/DUT/CPU/DP/EXMEM/dmemWEN
add wave -noupdate -divider {Request Block}
add wave -noupdate /system_tb/DUT/CPU/DP/RB/request_dmemREN_output
add wave -noupdate /system_tb/DUT/CPU/DP/RB/request_dmemWEN_output
add wave -noupdate -divider RAM
add wave -noupdate /system_tb/DUT/RAM/ramif/ramREN
add wave -noupdate /system_tb/DUT/RAM/ramif/ramWEN
add wave -noupdate /system_tb/DUT/RAM/ramif/ramaddr
add wave -noupdate /system_tb/DUT/RAM/ramif/ramstore
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {795621 ps} 0}
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
WaveRestoreZoom {472826 ps} {802563 ps}

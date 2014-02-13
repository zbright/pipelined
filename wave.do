onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate {/system_tb/DUT/CPU/DP/registerFile/registers[31]}
add wave -noupdate /system_tb/DUT/CPU/DP/regDestMux/out
add wave -noupdate -divider memReg
add wave -noupdate /system_tb/DUT/CPU/DP/memToRegMux/out
add wave -noupdate /system_tb/DUT/CPU/DP/memToRegMux/shiftedImmediate
add wave -noupdate /system_tb/DUT/CPU/DP/memToRegMux/memToReg
add wave -noupdate /system_tb/DUT/CPU/DP/memToRegMux/jal
add wave -noupdate /system_tb/DUT/CPU/DP/memToRegMux/dload
add wave -noupdate /system_tb/DUT/CPU/DP/memToRegMux/aluOut
add wave -noupdate /system_tb/DUT/CPU/DP/add4/pc_in
add wave -noupdate /system_tb/DUT/CPU/DP/add4/next_pc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {296833 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {41884 ps} {566884 ps}

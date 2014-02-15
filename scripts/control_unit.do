onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /control_unit_tb/ALUsrc
add wave -noupdate /control_unit_tb/memtoreg
add wave -noupdate /control_unit_tb/shift
add wave -noupdate /control_unit_tb/signzero
add wave -noupdate /control_unit_tb/ALUop
add wave -noupdate /control_unit_tb/JAL
add wave -noupdate /control_unit_tb/regwrite
add wave -noupdate /control_unit_tb/pcselect
add wave -noupdate /control_unit_tb/regdst
add wave -noupdate /control_unit_tb/branch
add wave -noupdate /control_unit_tb/dpif/imemaddr
add wave -noupdate /control_unit_tb/dpif/imemload
add wave -noupdate -expand /control_unit_tb/DUT/opcode
add wave -noupdate /control_unit_tb/DUT/shiftcode
add wave -noupdate /control_unit_tb/DUT/functioncode
add wave -noupdate /control_unit_tb/DUT/flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {36 ns} 0}
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
WaveRestoreZoom {0 ns} {217 ns}

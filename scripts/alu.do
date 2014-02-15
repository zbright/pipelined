onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alu_tb/OPCODE
add wave -noupdate /alu_tb/OUTPUT
add wave -noupdate /alu_tb/NEGATIVE
add wave -noupdate /alu_tb/OVERFLOW
add wave -noupdate /alu_tb/ZERO
add wave -noupdate /alu_tb/DUT/tempa
add wave -noupdate /alu_tb/DUT/tempb
add wave -noupdate /alu_tb/DUT/tempo
add wave -noupdate /alu_tb/DUT/A
add wave -noupdate /alu_tb/DUT/B
add wave -noupdate /alu_tb/DUT/SWITCHVAL
add wave -noupdate /alu_tb/DUT/TOGGLE
add wave -noupdate /alu_tb/DUT/ABSELECT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {696 ns} 0}
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
WaveRestoreZoom {696 ns} {789 ns}

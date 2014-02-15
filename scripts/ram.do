onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ram_tb/CLK
add wave -noupdate /ram_tb/nRST
add wave -noupdate /ram_tb/v1
add wave -noupdate /ram_tb/v2
add wave -noupdate /ram_tb/v3
add wave -noupdate /ram_tb/k
add wave -noupdate /ram_tb/ramif/ramREN
add wave -noupdate /ram_tb/ramif/ramWEN
add wave -noupdate /ram_tb/ramif/ramaddr
add wave -noupdate /ram_tb/ramif/ramstore
add wave -noupdate /ram_tb/ramif/ramload
add wave -noupdate /ram_tb/ramif/ramstate
add wave -noupdate /ram_tb/DUT/addr
add wave -noupdate /ram_tb/DUT/en
add wave -noupdate /ram_tb/DUT/wren
add wave -noupdate /ram_tb/DUT/rstate
add wave -noupdate /ram_tb/DUT/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {35844 ps} 0}
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
WaveRestoreZoom {19156 ps} {95781 ps}

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /register_file_tb/CLK
add wave -noupdate -radix decimal /register_file_tb/nRST
add wave -noupdate -radix decimal /register_file_tb/v1
add wave -noupdate -radix decimal /register_file_tb/v2
add wave -noupdate -radix decimal /register_file_tb/v3
add wave -noupdate -radix decimal /register_file_tb/rfif/wsel
add wave -noupdate -radix decimal /register_file_tb/rfif/WEN
add wave -noupdate -radix decimal /register_file_tb/rfif/rsel1
add wave -noupdate -radix decimal /register_file_tb/rfif/rsel2
add wave -noupdate -radix decimal /register_file_tb/rfif/wdat
add wave -noupdate -radix decimal /register_file_tb/rfif/rdat1
add wave -noupdate -radix decimal /register_file_tb/rfif/rdat2
add wave -noupdate -radix decimal -childformat {{{/register_file_tb/DUT/storeregister[31]} -radix decimal} {{/register_file_tb/DUT/storeregister[30]} -radix decimal} {{/register_file_tb/DUT/storeregister[29]} -radix decimal} {{/register_file_tb/DUT/storeregister[28]} -radix decimal} {{/register_file_tb/DUT/storeregister[27]} -radix decimal} {{/register_file_tb/DUT/storeregister[26]} -radix decimal} {{/register_file_tb/DUT/storeregister[25]} -radix decimal} {{/register_file_tb/DUT/storeregister[24]} -radix decimal} {{/register_file_tb/DUT/storeregister[23]} -radix decimal} {{/register_file_tb/DUT/storeregister[22]} -radix decimal} {{/register_file_tb/DUT/storeregister[21]} -radix decimal} {{/register_file_tb/DUT/storeregister[20]} -radix decimal} {{/register_file_tb/DUT/storeregister[19]} -radix decimal} {{/register_file_tb/DUT/storeregister[18]} -radix decimal} {{/register_file_tb/DUT/storeregister[17]} -radix decimal} {{/register_file_tb/DUT/storeregister[16]} -radix decimal} {{/register_file_tb/DUT/storeregister[15]} -radix decimal} {{/register_file_tb/DUT/storeregister[14]} -radix decimal} {{/register_file_tb/DUT/storeregister[13]} -radix decimal} {{/register_file_tb/DUT/storeregister[12]} -radix decimal} {{/register_file_tb/DUT/storeregister[11]} -radix decimal} {{/register_file_tb/DUT/storeregister[10]} -radix decimal} {{/register_file_tb/DUT/storeregister[9]} -radix decimal} {{/register_file_tb/DUT/storeregister[8]} -radix decimal} {{/register_file_tb/DUT/storeregister[7]} -radix decimal} {{/register_file_tb/DUT/storeregister[6]} -radix decimal} {{/register_file_tb/DUT/storeregister[5]} -radix decimal} {{/register_file_tb/DUT/storeregister[4]} -radix decimal} {{/register_file_tb/DUT/storeregister[3]} -radix decimal} {{/register_file_tb/DUT/storeregister[2]} -radix decimal} {{/register_file_tb/DUT/storeregister[1]} -radix decimal} {{/register_file_tb/DUT/storeregister[0]} -radix decimal}} -subitemconfig {{/register_file_tb/DUT/storeregister[31]} {-radix decimal} {/register_file_tb/DUT/storeregister[30]} {-radix decimal} {/register_file_tb/DUT/storeregister[29]} {-radix decimal} {/register_file_tb/DUT/storeregister[28]} {-radix decimal} {/register_file_tb/DUT/storeregister[27]} {-radix decimal} {/register_file_tb/DUT/storeregister[26]} {-radix decimal} {/register_file_tb/DUT/storeregister[25]} {-radix decimal} {/register_file_tb/DUT/storeregister[24]} {-radix decimal} {/register_file_tb/DUT/storeregister[23]} {-radix decimal} {/register_file_tb/DUT/storeregister[22]} {-radix decimal} {/register_file_tb/DUT/storeregister[21]} {-radix decimal} {/register_file_tb/DUT/storeregister[20]} {-radix decimal} {/register_file_tb/DUT/storeregister[19]} {-radix decimal} {/register_file_tb/DUT/storeregister[18]} {-radix decimal} {/register_file_tb/DUT/storeregister[17]} {-radix decimal} {/register_file_tb/DUT/storeregister[16]} {-radix decimal} {/register_file_tb/DUT/storeregister[15]} {-radix decimal} {/register_file_tb/DUT/storeregister[14]} {-radix decimal} {/register_file_tb/DUT/storeregister[13]} {-radix decimal} {/register_file_tb/DUT/storeregister[12]} {-radix decimal} {/register_file_tb/DUT/storeregister[11]} {-radix decimal} {/register_file_tb/DUT/storeregister[10]} {-radix decimal} {/register_file_tb/DUT/storeregister[9]} {-radix decimal} {/register_file_tb/DUT/storeregister[8]} {-radix decimal} {/register_file_tb/DUT/storeregister[7]} {-radix decimal} {/register_file_tb/DUT/storeregister[6]} {-radix decimal} {/register_file_tb/DUT/storeregister[5]} {-radix decimal} {/register_file_tb/DUT/storeregister[4]} {-radix decimal} {/register_file_tb/DUT/storeregister[3]} {-radix decimal} {/register_file_tb/DUT/storeregister[2]} {-radix decimal} {/register_file_tb/DUT/storeregister[1]} {-radix decimal} {/register_file_tb/DUT/storeregister[0]} {-radix decimal}} /register_file_tb/DUT/storeregister
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {190 ns} 0}
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
WaveRestoreZoom {0 ns} {1050 ns}

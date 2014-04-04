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
add wave -noupdate -expand -group {Register 0} /system_tb/DUT/CPU/DP0/REGISTER/CLK
add wave -noupdate -expand -group {Register 0} /system_tb/DUT/CPU/DP0/REGISTER/nRST
add wave -noupdate -expand -group {Register 0} -expand /system_tb/DUT/CPU/DP0/REGISTER/storeregister
add wave -noupdate -group {iCache 0} /system_tb/DUT/CPU/CM0/ICACHE/CLK
add wave -noupdate -group {iCache 0} /system_tb/DUT/CPU/CM0/ICACHE/nRST
add wave -noupdate -group {iCache 0} /system_tb/DUT/CPU/CM0/ICACHE/cacheaddress
add wave -noupdate -group {iCache 0} -expand /system_tb/DUT/CPU/CM0/ICACHE/cacheblock
add wave -noupdate -group {iCache 0} /system_tb/DUT/CPU/CM0/ICACHE/match
add wave -noupdate -expand -group {IFID 0} /system_tb/DUT/CPU/DP0/IFID/CLK
add wave -noupdate -expand -group {IFID 0} /system_tb/DUT/CPU/DP0/IFID/nRST
add wave -noupdate -expand -group {IFID 0} /system_tb/DUT/CPU/DP0/IFID/NPC
add wave -noupdate -expand -group {IFID 0} /system_tb/DUT/CPU/DP0/IFID/imemload
add wave -noupdate -expand -group {IFID 0} /system_tb/DUT/CPU/DP0/IFID/wen
add wave -noupdate -expand -group {IFID 0} /system_tb/DUT/CPU/DP0/IFID/flush
add wave -noupdate -expand -group {IFID 0} /system_tb/DUT/CPU/DP0/IFID/npc_if_id_output
add wave -noupdate -expand -group {IFID 0} /system_tb/DUT/CPU/DP0/IFID/imemload_if_id_output
add wave -noupdate -expand -group {IFID 0} /system_tb/DUT/CPU/DP0/IFID/temp_NPC_output
add wave -noupdate -expand -group {IFID 0} /system_tb/DUT/CPU/DP0/IFID/temp_imemload_output
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
add wave -noupdate -expand -group {Register 1} /system_tb/DUT/CPU/DP1/REGISTER/CLK
add wave -noupdate -expand -group {Register 1} /system_tb/DUT/CPU/DP1/REGISTER/nRST
add wave -noupdate -expand -group {Register 1} -expand /system_tb/DUT/CPU/DP1/REGISTER/storeregister
add wave -noupdate -group {iCache 1} /system_tb/DUT/CPU/CM1/ICACHE/CLK
add wave -noupdate -group {iCache 1} /system_tb/DUT/CPU/CM1/ICACHE/nRST
add wave -noupdate -group {iCache 1} /system_tb/DUT/CPU/CM1/ICACHE/cacheaddress
add wave -noupdate -group {iCache 1} -expand /system_tb/DUT/CPU/CM1/ICACHE/cacheblock
add wave -noupdate -group {iCache 1} /system_tb/DUT/CPU/CM1/ICACHE/match
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate /system_tb/DUT/CPU/CLK
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49536 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {154959 ps}

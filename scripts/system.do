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
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/dload
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/ccwrite
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/ccwait
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/cctrans
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/ccsnoopaddr
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/ccinv
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -expand -group CCIF /system_tb/DUT/CPU/ccif/ramload
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
add wave -noupdate -group {Register 0} /system_tb/DUT/CPU/DP0/REGISTER/CLK
add wave -noupdate -group {Register 0} /system_tb/DUT/CPU/DP0/REGISTER/nRST
add wave -noupdate -group {Register 0} -expand /system_tb/DUT/CPU/DP0/REGISTER/storeregister
add wave -noupdate -group {iCache 0} /system_tb/DUT/CPU/CM0/ICACHE/CLK
add wave -noupdate -group {iCache 0} /system_tb/DUT/CPU/CM0/ICACHE/nRST
add wave -noupdate -group {iCache 0} /system_tb/DUT/CPU/CM0/ICACHE/cacheaddress
add wave -noupdate -group {iCache 0} -expand /system_tb/DUT/CPU/CM0/ICACHE/cacheblock
add wave -noupdate -group {iCache 0} /system_tb/DUT/CPU/CM0/ICACHE/match
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/CLK
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/nRST
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/cacheaddress
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/cacheblock_one
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/cacheblock_two
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/cacheblock_one_next
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/cacheblock_two_next
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/temp_fetch_store
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/temp_fetch_store_next
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/match_one
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/match_two
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/i
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/hit_count
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/next_hit_count
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/flag
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/flag_next
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/snoop_hit_2
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/snoop_hit_1
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/snoop_addr
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/cstate
add wave -noupdate -expand -group {dcache 0} /system_tb/DUT/CPU/CM0/DCACHE/nstate
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
add wave -noupdate -group {Register 1} /system_tb/DUT/CPU/DP1/REGISTER/CLK
add wave -noupdate -group {Register 1} /system_tb/DUT/CPU/DP1/REGISTER/nRST
add wave -noupdate -group {Register 1} /system_tb/DUT/CPU/DP1/REGISTER/storeregister
add wave -noupdate -group {iCache 1} /system_tb/DUT/CPU/CM1/ICACHE/CLK
add wave -noupdate -group {iCache 1} /system_tb/DUT/CPU/CM1/ICACHE/nRST
add wave -noupdate -group {iCache 1} /system_tb/DUT/CPU/CM1/ICACHE/cacheaddress
add wave -noupdate -group {iCache 1} -expand /system_tb/DUT/CPU/CM1/ICACHE/cacheblock
add wave -noupdate -group {iCache 1} /system_tb/DUT/CPU/CM1/ICACHE/match
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/CLK
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/nRST
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/cacheaddress
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/cacheblock_one
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/cacheblock_two
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/cacheblock_one_next
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/cacheblock_two_next
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/temp_fetch_store
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/temp_fetch_store_next
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/match_one
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/match_two
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/i
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/hit_count
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/next_hit_count
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/flag
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/flag_next
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/snoop_hit_2
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/snoop_hit_1
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/snoop_addr
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/cstate
add wave -noupdate -expand -group {dcache 1} /system_tb/DUT/CPU/CM1/DCACHE/nstate
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/active_core
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/next_active_core
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/cstate
add wave -noupdate -expand -group MemController /system_tb/DUT/CPU/CC/nstate
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate /system_tb/DUT/CPU/CLK
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {600000 ps} 0}
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
WaveRestoreZoom {571207 ps} {612983 ps}

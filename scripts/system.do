onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate /system_tb/DUT/nRST
add wave -noupdate -divider syif
add wave -noupdate /system_tb/DUT/syif/tbCTRL
add wave -noupdate /system_tb/DUT/syif/halt
add wave -noupdate /system_tb/DUT/syif/WEN
add wave -noupdate /system_tb/DUT/syif/REN
add wave -noupdate /system_tb/DUT/syif/addr
add wave -noupdate /system_tb/DUT/syif/store
add wave -noupdate /system_tb/DUT/syif/load
add wave -noupdate -divider prif
add wave -noupdate /system_tb/DUT/prif/ramREN
add wave -noupdate /system_tb/DUT/prif/ramWEN
add wave -noupdate /system_tb/DUT/prif/ramaddr
add wave -noupdate /system_tb/DUT/prif/ramstore
add wave -noupdate /system_tb/DUT/prif/ramload
add wave -noupdate /system_tb/DUT/prif/ramstate
add wave -noupdate /system_tb/DUT/prif/memREN
add wave -noupdate /system_tb/DUT/prif/memWEN
add wave -noupdate /system_tb/DUT/prif/memaddr
add wave -noupdate /system_tb/DUT/prif/memstore
add wave -noupdate -divider PC
add wave -noupdate /system_tb/DUT/CPU/DP/pc_count_four_output
add wave -noupdate /system_tb/DUT/CPU/DP/next_pc_count
add wave -noupdate /system_tb/DUT/CPU/DP/current_pc_count
add wave -noupdate -divider {Control Unit}
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/ALUsrc
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/memtoreg
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/shift
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/signzero
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/ALUop
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/JAL
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/regwrite
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/pcselect
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/regdst
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/branch
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/request_dmemREN
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/request_dmemWEN
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/imemload
add wave -noupdate /system_tb/DUT/CPU/dcif/imemREN
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/opcode
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/shiftcode
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/functioncode
add wave -noupdate /system_tb/DUT/CPU/DP/REQUEST/flag
add wave -noupdate -divider ALU
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/A
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/B
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/OPCODE
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/OUTPUT
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/NEGATIVE
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/OVERFLOW
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/ZERO
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/tempa
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/tempb
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/tempo
add wave -noupdate -divider Request
add wave -noupdate /system_tb/DUT/CPU/DP/RB/dhit
add wave -noupdate /system_tb/DUT/CPU/DP/RB/request_dmemREN
add wave -noupdate /system_tb/DUT/CPU/DP/RB/request_dmemWEN
add wave -noupdate /system_tb/DUT/CPU/DP/RB/request_dmemREN_output
add wave -noupdate /system_tb/DUT/CPU/DP/RB/request_dmemWEN_output
add wave -noupdate -divider Register
add wave -noupdate /system_tb/DUT/CPU/DP/REGISTER/CLK
add wave -noupdate /system_tb/DUT/CPU/DP/REGISTER/nRST
add wave -noupdate /system_tb/DUT/CPU/DP/REGISTER/storeregister
add wave -noupdate /system_tb/DUT/CPU/DP/REGISTER/k
add wave -noupdate -divider RAM
add wave -noupdate /system_tb/DUT/CPU/ccif/CPUS
add wave -noupdate /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -expand /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -expand /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -expand /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate /system_tb/DUT/CPU/ccif/iload
add wave -noupdate /system_tb/DUT/CPU/ccif/dload
add wave -noupdate /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -expand /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate /system_tb/DUT/CPU/ccif/ramload
add wave -noupdate /system_tb/DUT/CPU/dcif/halt
add wave -noupdate /system_tb/DUT/RAM/ramif/ramREN
add wave -noupdate /system_tb/DUT/RAM/ramif/ramWEN
add wave -noupdate /system_tb/DUT/RAM/ramif/ramaddr
add wave -noupdate /system_tb/DUT/RAM/ramif/ramstore
add wave -noupdate /system_tb/DUT/RAM/ramif/ramload
add wave -noupdate /system_tb/DUT/RAM/ramif/ramstate
add wave -noupdate /system_tb/DUT/RAM/ramif/memREN
add wave -noupdate /system_tb/DUT/RAM/ramif/memWEN
add wave -noupdate /system_tb/DUT/RAM/ramif/memaddr
add wave -noupdate /system_tb/DUT/RAM/ramif/memstore
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {176277 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 164
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

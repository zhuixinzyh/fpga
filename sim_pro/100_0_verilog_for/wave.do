onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider 波形名字
add wave -noupdate /tb/rst_n
add wave -noupdate /tb/clk
add wave -noupdate /tb/tb_data
add wave -noupdate /tb/tb_ret
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {99986311 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {99984800 ps} {100000800 ps}

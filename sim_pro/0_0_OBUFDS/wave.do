onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider 波形名字
add wave -noupdate /tb/clk
add wave -noupdate /tb/rst_n
add wave -noupdate -color Yellow /tb/in0
add wave -noupdate -color Yellow /tb/ooo
add wave -noupdate -color Yellow /tb/oob
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {987171 ps} 0}
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
WaveRestoreZoom {983550 ps} {1015550 ps}

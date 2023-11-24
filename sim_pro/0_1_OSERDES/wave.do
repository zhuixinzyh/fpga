onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider 波形名字
add wave -noupdate /tb/clk
add wave -noupdate /tb/rst_n
add wave -noupdate -color Magenta /tb/in0
add wave -noupdate -color Magenta /tb/ooo
add wave -noupdate -color Magenta /tb/oob
add wave -noupdate -color Yellow -radix binary -childformat {{{/tb/reg_data2serial[3]} -radix binary} {{/tb/reg_data2serial[2]} -radix binary} {{/tb/reg_data2serial[1]} -radix binary} {{/tb/reg_data2serial[0]} -radix binary}} -subitemconfig {{/tb/reg_data2serial[3]} {-color Yellow -height 17 -radix binary} {/tb/reg_data2serial[2]} {-color Yellow -height 17 -radix binary} {/tb/reg_data2serial[1]} {-color Yellow -height 17 -radix binary} {/tb/reg_data2serial[0]} {-color Yellow -height 17 -radix binary}} /tb/reg_data2serial
add wave -noupdate -color Cyan /tb/w_serial_data
add wave -noupdate -color Yellow /tb/clk_100m
add wave -noupdate -color Yellow /tb/clk_50m
add wave -noupdate /tb/clk_10m
add wave -noupdate /tb/inst_tb_clk_div_0/cnt
add wave -noupdate /tb/inst_tb_clk_div_1/cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {410227 ps} 0}
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
WaveRestoreZoom {374265 ps} {800249 ps}

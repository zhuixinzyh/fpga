#https://developer.aliyun.com/article/1051520
#错误码 1：没有工程路径文件
#do d.do
#清除TCL打印信息

do init.do
.main clear

#仿真开始
#退出当前仿真
quit -sim

#编译源码
do make.do

vsim -voptargs="+acc" \
     -L work \
     -L unisims_ver \
     -L unimacro_ver \
     -L secureip \
     -L xpm \
     -lib work \
     work.tb \
     work.glbl


view wave
view structure
view signals
do wave.do
#add wave -divider {波形名字}
#add wave tb/*

run 1000ns


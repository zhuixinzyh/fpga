#https://developer.aliyun.com/article/1051520
#错误码 1：没有工程路径文件
#do d.do

set current_directory [pwd]
puts "current_directory : $current_directory"
#路径文件名，放在工程的目录下，与do文件相同的路径
set pro_path_name "pro_path.txt"
#工程状态，lack_pro_path_file pro_path_file_exist old version    latest_version  
set project_status "init_project"
#判断是否是新工程，判断依据是：读取路径文件并与当前路径对比。如果相同，那就是旧工程
#如果不同，那就是新的工程

#清除TCL打印信息
.main clear
###########################################################################################
#清理工程，主要是复制工程后，一些初始文件需要清除，另外在保存工程的时候，也不需要保存中间的文件
# 文件路径
set file_path "./$pro_path_name"
# 使用file exists命令检查文件是否存在
if { [file exists $file_path] } {
    puts "file exist: $file_path"
    set project_status "pro_path_file_exist"
} else {
    puts "cann't find file: $file_path"
    set project_status "lack_pro_path_file"
    puts "project_status : $project_status"
    #如果路径文件不存在，那就退出脚本，需要先手动创建，创建即可，内容不重要
    exit 1
}
puts "project_status : $project_status"
# 打开文件以进行读取
set file_handle [open $file_path "r+"]
# 检查文件是否成功打开
if { $file_handle != "" } {
    # 读取文件内容并保存到变量
    set file_content [read $file_handle]

    # 打印读取的内容
    puts "file content: $file_content"
    if {$file_content == $current_directory} {
        set project_status "latest_version"
        puts "project_status : $project_status"
    } else {
        set project_status "old_version"
        puts "project_status : $project_status"
        #如果不相等，说明是旧的工程，那就先把之前的配置信息删除
        do clear.do
        puts "#### do clear.do done"
        #清理完成之后，再把路径文件更新，以后就不用创建删除
        seek $file_handle 0 start
        puts -nonewline $file_handle $current_directory
    }
    # 关闭文件
    close $file_handle

} else {
    puts "cann't open file: $file_path"
}


#######################################################################################
#仿真开始
#退出当前仿真
quit -sim

#编译源码
do make.do

#vsim仿真指令
#开始仿真（条件根据需要改变），work.是固定用法后面跟仿真激励文件的文件名。一般文件名和模块名称是对应的
vsim -t 1ns -voptargs=+acc work.tb
# -novopt
#添加指定信号
#添加顶层所有的信号
# 打开波形窗口
view wave
view structure

# 打开信号窗口
view signals

# 添加波形模板
add wave -divider {波形名字}
add wave tb/*

#运行xxms
run 1us
set condition 1
.main clear



# 获取当前工作目录
set current_directory [pwd]

# 构建要写入的文件路径
set file_path [file join $current_directory "pro_path.txt"]

# 打开文件以进行写入
set file_handle [open $file_path "w"]

# 检查文件是否成功打开
if { $file_handle != "" } {
    # 写入当前路径到文件
    puts $file_handle "$current_directory"
    
    # 关闭文件
    close $file_handle
    puts "has write: $file_path"
} else {
    puts "cann't open: $file_path"
}







#
## 文件路径
#set file_path "./new.txt"
## 打开文件以进行写入
#set file_handle [open $file_path "w"]
#
## 检查文件是否成功打开
#if { $file_handle != "" } {
#    puts "file creat success: $file_path"
#    # 关闭文件
#    close $file_handle
#} else {
#    puts "cann't creat file: $file_path"
#}
#
#
#
#
#
#if { $condition == 1 } {
#    # 这段代码将在条件为真时执行
#    puts "#### condition : $condition"
#} else {
#    # 这段代码将在条件为假时执行
#    
#
#
#
#    # 文件路径
#    set file_path "./new.txt"
#
#    # 使用file exists命令检查文件是否存在
#    if { [file exists $file_path] } {
#        puts "file exist: $file_path"
#    } else {
#        puts "cann't find file: $file_path"
#    }
#
#}
##exit   这个会退出软件
##仅仅退出do脚本
#return
#




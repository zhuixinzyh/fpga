`define DEBUG//DEBUG RELEASE


// 定义一个函数来计算数值所需的位宽
function [7:0] calculateBitWidth;
    input [31:0] num;
    integer temp;
    begin
        // 计算位宽
        temp = num;
        calculateBitWidth = 0;
        while (temp != 0) begin
            temp = temp >> 1;
            calculateBitWidth = calculateBitWidth + 1;
        end
    end
endfunction
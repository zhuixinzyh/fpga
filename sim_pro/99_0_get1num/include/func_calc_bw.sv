`ifndef    __FUNC_CALC_BW__
`define    __FUNC_CALC_BW__
// 定义一个函数来计算数值所需的位宽
function [7:0] func_calc_bw;
    input [31:0] num;
    integer temp;
    begin
        // 计算位宽
        temp = num;
        func_calc_bw = 0;
        while (temp != 0) begin
            temp = temp >> 1;
            func_calc_bw = func_calc_bw + 1;
        end
    end
endfunction
`endif
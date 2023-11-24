`include "./include/define.sv"
`include "./include/func_calc_bw.sv"

module get1num_add(
    input   [7:0]   i_data,
    output  [31:0]  ret
);
assign ret = i_data[0]+i_data[1]+i_data[2]+i_data[3]+i_data[4]+i_data[5]+i_data[6]+i_data[7];
endmodule
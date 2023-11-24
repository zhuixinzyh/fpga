`include "./include/define.sv"
`include "./include/func_calc_bw.sv"

module example_for(
        i_data,
        ret
);
 parameter INPUT_DATA_WIDTH = 1;
 localparam RET_BW = func_calc_bw(INPUT_DATA_WIDTH);

 input   [INPUT_DATA_WIDTH-1:0] i_data;
 output  [RET_BW-1:0] ret;


`ifdef DEBUG
initial begin
    $display("RET_BW: ",RET_BW);
end
`endif


endmodule
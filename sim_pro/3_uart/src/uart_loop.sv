module uart_loop(
    input sys_clk_p,
    input sys_clk_n,
    input sys_rst_n,
    output  o_uart_tx,
    input   i_uart_rv
);
parameter FRE_CLK = 100_000_000;
parameter UART_BPS = 115200;
wire sys_clk;

IBUFDS diff_clock(
    .I(sys_clk_p),
    .IB(sys_clk_n),
    .O(sys_clk)
);
reg [7:0] data_buff;
reg [31:0] cnt;
wire en;
assign en = (cnt==20000) ? 1'b1:1'b0;
always @(posedge sys_clk) begin
    if(!sys_rst_n) begin
        data_buff<='d0;
    end
    else if(cnt==20000) begin
        data_buff<=data_buff+1'b1;
    end
    else begin
        data_buff<=data_buff;
    end
end

always @(posedge sys_clk) begin
    if(!sys_rst_n) begin
        cnt<='d0;
    end
    else if(cnt==20000) begin
        cnt<='d0;
    end
    else begin
        cnt<=cnt+1'b1;
    end
end
uart_tx inst_uart_tx(
    .clk(sys_clk),
    .rst_n(sys_rst_n),
    .i_data(data_buff),
    .i_en(en),
    .o_uart_tx(o_uart_tx),
    .o_uart_busy()
);
endmodule
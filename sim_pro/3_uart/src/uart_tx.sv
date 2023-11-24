`include "./include/common.sv"

module uart_tx(
    input           clk,
    input           rst_n,
    input   [7:0]   i_data,
    input           i_en,//down2up is trans
    output    reg   o_uart_tx,
    output    reg   o_uart_busy
);
parameter FRE_CLK = 100_000_000;
parameter UART_BPS = 115200;
localparam CNT = FRE_CLK/UART_BPS;//每个bit的点数，约为868。如果是9600,约为10416
localparam BIT_NUM = 10;
`ifdef DEBUG
    //display只能在always里使用
    always @(posedge clk) begin
        $display("uart tx cnt: %d\n",CNT);
        $display("bit width : %d\n",calculateBitWidth(CNT));
    end
`endif

reg [calculateBitWidth(CNT)-1:0] cnt;
reg [BIT_NUM-1:0]                data_buff;//7+2为起始位和停止位
reg [3:0]                        tx_cnt;
reg                              en_d0;
reg                              en_d1;
wire                             en_flag;
reg                              trans_flag;
//en边沿检测
always @(posedge clk) begin
    if(!rst_n) begin
        en_d0<=1'b0;
        en_d1<=1'b0;
    end
    else begin
        en_d0<=en_d1;
        en_d1<=i_en;
    end
end
//上升沿
assign en_flag = en_d1&(~en_d0);
//寄存要发送的数据
always @(posedge clk) begin
    if(!rst_n) begin
        data_buff<=8'd0;
    end  
    else if(en_flag) begin
        data_buff<={1'b1,i_data,1'b0};
    end
    else begin
        data_buff<=data_buff;
    end
end
always @(posedge clk) begin
    if(!rst_n) begin
        trans_flag<=1'b0;
    end
    else if(en_flag) begin
        trans_flag<=1'b1;
    end
    else if(tx_cnt==BIT_NUM-1) begin
        trans_flag<=1'b0;
    end
    else begin
        trans_flag<=trans_flag;
    end
end
//
always @(posedge clk) begin
    if(!rst_n) begin
        cnt<='d0;
    end
    else if(trans_flag) begin
        if(cnt==CNT) begin
            cnt<='d0;
        end
        else begin
            cnt<=cnt+1'b1;
        end
    end
    else begin
        cnt<='d0;
    end
end
always @(posedge clk) begin
    if(!rst_n) begin
        tx_cnt<='d0;
    end
    else if(trans_flag)begin
            if(cnt==CNT) begin
                tx_cnt<=tx_cnt+1'b1;
            end
            else begin
                tx_cnt<=tx_cnt;
            end
    end
    else begin
        tx_cnt<='d0;
    end
end
always @(posedge clk) begin
    if(!rst_n) begin
        o_uart_tx<=1'b1;//uart 空闲状态为高
    end
    else if(trans_flag) begin
        case(tx_cnt)
            'd0:o_uart_tx<=data_buff[0];//起始位
            'd1:o_uart_tx<=data_buff[1];//LSB
            'd2:o_uart_tx<=data_buff[2];
            'd3:o_uart_tx<=data_buff[3];
            'd4:o_uart_tx<=data_buff[4];
            'd5:o_uart_tx<=data_buff[5];
            'd6:o_uart_tx<=data_buff[6];
            'd7:o_uart_tx<=data_buff[7];
            'd8:o_uart_tx<=data_buff[8];//MSB
            'd9:o_uart_tx<=data_buff[9];//停止位
            default:o_uart_tx<=1'b1;
        endcase
    end
    else begin
        o_uart_tx<=1'b1;//uart 空闲状态为高
    end
end
endmodule

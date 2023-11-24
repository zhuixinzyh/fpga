`timescale 1ns / 1ps
//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                               
//----------------------------------------------------------------------------------------
// File name:           ip_clk_wiz
// Last modified Date:   2021/10/19 10:19:22
// Last Version:        V1.0
// Descriptions:        IP核之MMCM/PLL实验
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:         2021/10/19 10:19:22
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module  ip_clk_wiz(
    input               sys_clk_p ,       //系统差分输入时钟
    input               sys_clk_n ,       //系统差分输入时钟
    input               sys_rst_n      ,  //系统复位，低电平有效
    //输出时钟
    output              clk_200m       ,  //200Mhz时钟频率
    output              clk_100m,         //100Mhz时钟频率
    output              clk_100m_180deg , //100Mhz时钟频率,相位偏移180度
    output              clk_25m           //25Mhz时钟频率
    );

//wire define
wire        locked;

//*****************************************************
//**                    main code
//*****************************************************

//MMCM/PLL IP核的例化
 clk_wiz_0 u_clk_wiz_0
   (
    // Clock out ports
    .clk_200m           (clk_200m),            // output clk_200m
    .clk_100m           (clk_100m),            // output clk_100m
    .clk_100m_180deg    (clk_100m_180deg),     // output clk_100m_180deg
    .clk_25m            (clk_25m),             // output clk_25m
    // Status and control signals
    .reset              (~sys_rst_n),          // input reset
    .locked             (locked),              // output locked
    // Clock in ports
    .clk_in1_p          (sys_clk_p),          // input clk_in1_p
    .clk_in1_n          (sys_clk_n));         // input clk_in1_n

endmodule


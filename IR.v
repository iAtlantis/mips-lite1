/*
    IR主要功能是完成对来自IM的指令的缓冲。
异步复位：rst=1 且 irwr=1，im_dout<-0

同步缓冲：rst=0，clk 上升沿且 irwr=1，im_dout<-im_din

*/
`timescale 1ns / 1ns
module IR
        (
            input [31:0] im_din,       //指令输入
            input irwr,                 //写使能信号
            input rst,                  //复位信号
            input clk,                  //时钟信号
            output reg [31:0] im_dout     //指令输出
        );


		  
//always @ (posedge clk)
//      begin
//		  if(irwr)begin
//				if(!rst)
//				  im_dout <= im_din;
//				else
//				  im_dout <= 32'h000000000;
//			end
//      end
always @ (irwr)
	begin
		if( !rst )
			im_dout <= im_din;
		else
			im_dout <= 0;
	end

endmodule
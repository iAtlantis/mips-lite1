/*
    IMnoc是指令存储器，主要功能是根据读控制信号DMWr，读写对应addr地址的32位数据
    
    1	读指令存储器	输出地址所对应的指令，q imem[address]
*/
`timescale 1ns /  1ns
module IMnoc
        (
				input clk,
            input [11:2] address,   //访问地址
            output reg [31:0] dout     //读出的指令
        );
        
        //输出地址所对应的指令，q <- imem[address]
        reg [31:0] imem [0:1023];
        initial begin
            dout = 32'h00000000;
				imem[0]=32'b00000000001000100001100000100001;//addu $1 $2 $3;
        end

        always@(posedge clk)
            begin
                dout = imem[address];
            end

endmodule
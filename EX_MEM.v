module EX_MEM(input clk, rst, input MemRead2, MemWrite2,input MemToReg2, RegWrite2, input [7:0] ReadData2_2, input [7:0] AluOut, input [2:0] RegDst,
              output reg MemRead3, MemWrite3,output reg MemToReg3, RegWrite3, output reg [7:0] ReadData2_3, output reg[7:0] AluOut2, output reg [2:0] RegDst2);
  always@(posedge clk, posedge rst)
  begin
    if(rst) begin
      MemRead3 <= 1'b0;
      MemWrite3 <= 1'b0;
      MemToReg3 <= 1'b0;
      RegWrite3 <= 1'b0;
      ReadData2_3 <= 8'b0;
      AluOut2 <= 8'b0;
      RegDst2 <= 2'b0;
    end
    else if(clk) begin
      MemRead3 <= MemRead2;
      MemWrite3 <= MemWrite2;
      MemToReg3 <= MemToReg2;
      RegWrite3 <= RegWrite2;
      ReadData2_3 <= ReadData2_2;
      AluOut2 <= AluOut;
      RegDst2 <= RegDst;
    end
    else begin 
      MemRead3 <= MemRead3;
      MemWrite3 <= MemWrite3;
      MemToReg3 <= MemToReg3;
      RegWrite3 <= RegWrite3;
      ReadData2_3 <= ReadData2_3;
      AluOut2 <= AluOut2;
      RegDst2 <= RegDst2;
    end
  end
  
endmodule 



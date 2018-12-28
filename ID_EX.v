module ID_EX(input clk, rst, input [18:0] InsOut2, input  Change1, ConstEnable1, input [3:0] AluOp1,
              input MemRead1, MemWrite1,input MemToReg1, RegWrite1, input [7:0] ReadData1, ReadData2,input [2:0] r1, r2,
              output reg[18:0] InsOut3, output reg  Change2, ConstEnable2, output reg [3:0] AluOp2,
              output reg MemRead2, MemWrite2,output reg MemToReg2, RegWrite2, output reg [7:0] ReadData1_2, ReadData2_2, output reg[2:0] R1,R2);
  always@(posedge clk, posedge rst)
  begin
    if(rst) begin
      InsOut3 <= 12'b0;
      Change2 <= 1'b0;
      ConstEnable2 <= 1'b0;
      AluOp2 <= 4'b0;
      MemRead2 <= 1'b0;
      MemWrite2 <= 1'b0;
      MemToReg2 <= 1'b0;
      RegWrite2 <= 1'b0;
      ReadData1_2 <= 8'b0;
      ReadData2_2 <= 8'b0;
      R1 <= 3'b0;
      R2 <= 3'b0;
    end
    else if(clk) begin
      InsOut3 <= InsOut2;
      Change2 <= Change1;
      ConstEnable2 <= ConstEnable1;
      AluOp2 <= AluOp1;
      MemRead2 <= MemRead1;
      MemWrite2 <= MemWrite1;
      MemToReg2 <= MemToReg1;
      RegWrite2 <= RegWrite1;
      ReadData1_2 <= ReadData1;
      ReadData2_2 <= ReadData2;
      R1 <= r1;
      R2 <= r2;
    end
    else begin 
      InsOut3 <= InsOut3;
      Change2 <= Change2;
      ConstEnable2 <= ConstEnable2;
      AluOp2 <= AluOp2;
      MemRead2 <= MemRead2;
      MemWrite2 <= MemWrite2;
      MemToReg2 <= MemToReg2;
      RegWrite2 <= RegWrite2;
      ReadData1_2 <= ReadData1_2;
      ReadData2_2 <= ReadData2_2;
      R1 <= R1;
      R2 <= R2;
    end
  end
  
endmodule 


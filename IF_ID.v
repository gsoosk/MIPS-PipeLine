module IF_ID(input clk, rst, Flush, NW, input [11:0] PCout, input [18:0] InsOut ,input Branch, Change, ConstEnable, input [3:0] AluOp,
              input MemRead, MemWrite,input MemToReg, RegWrite, input RegTwoAddr, output reg [11:0] PCout2, output reg[18:0] InsOut2,
              output reg Branch1, Change1, ConstEnable1, output reg [3:0] AluOp1, output reg MemRead1, MemWrite1,output reg MemToReg1, RegWrite1,
              output reg RegTwoAddr1);
  always@(posedge clk, posedge rst)
  begin
    if(rst) begin
      PCout2 <= 12'b0;
      InsOut2 <= 12'b0;
      Branch1 <= 1'b0;
      Change1 <= 1'b0;
      ConstEnable1 <= 1'b0;
      AluOp1 <= 4'b0;
      MemRead1 <= 1'b0;
      MemWrite1 <= 1'b0;
      MemToReg1 <= 1'b0;
      RegWrite1 <= 1'b0;
      RegTwoAddr1 <= 1'b0;
    end
    else if(clk) begin
      if(Flush) begin
      PCout2 <= 12'b0;
      InsOut2 <= 12'b0;
      Branch1 <= 1'b0;
      Change1 <= 1'b0;
      ConstEnable1 <= 1'b0;
      AluOp1 <= 4'b0;
      MemRead1 <= 1'b0;
      MemWrite1 <= 1'b0;
      MemToReg1 <= 1'b0;
      RegWrite1 <= 1'b0;
      RegTwoAddr1 <= 1'b0;
      end       
      else if(~NW) begin
        PCout2 <= PCout;
        InsOut2 <= InsOut;
        Branch1 <= Branch;
        Change1 <= Change;
        ConstEnable1 <= ConstEnable;
        AluOp1 <= AluOp;
        MemRead1 <= MemRead;
        MemWrite1 <= MemWrite;
        MemToReg1 <= MemToReg;
        RegWrite1 <= RegWrite;
        RegTwoAddr1 <= RegTwoAddr;
        end
      else
        begin
          PCout2 <= PCout2;
          InsOut2 <= InsOut2;
          Branch1 <= Branch1;
          Change1 <= Change1;
          ConstEnable1 <= ConstEnable1;
          AluOp1 <= AluOp1;
          MemRead1 <= MemRead1;
          MemWrite1 <= MemWrite1;
          MemToReg1 <= MemToReg1;
          RegWrite1 <= RegWrite1;
          RegTwoAddr1 <= RegTwoAddr1;
        end
    end
    else begin 
      PCout2 <= PCout2;
      InsOut2 <= InsOut2;
      Branch1 <= Branch1;
      Change1 <= Change1;
      ConstEnable1 <= ConstEnable1;
      AluOp1 <= AluOp1;
      MemRead1 <= MemRead1;
      MemWrite1 <= MemWrite1;
      MemToReg1 <= MemToReg1;
      RegWrite1 <= RegWrite1;
      RegTwoAddr1 <= RegTwoAddr1;
    end
  end
  
endmodule 

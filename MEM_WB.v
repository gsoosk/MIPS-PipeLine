module MEM_WB(input clk, rst,input MemToReg3, RegWrite3, input [7:0] MemoryReadData, input [7:0] AluOut2, input [2:0] RegDst2,
              output reg MemToReg4, RegWrite4, output reg [7:0] MemoryReadData2, output reg[7:0] AluOut3, output reg [2:0] RegDst3);
  always@(posedge clk, posedge rst)
  begin
    if(rst) begin
      MemToReg4 <= 1'b0;
      RegWrite4 <= 1'b0;
      MemoryReadData2 <= 8'b0;
      AluOut3 <= 8'b0;
      RegDst3 <= 3'b0;
    end
    else if(clk) begin
      MemToReg4 <= MemToReg3;
      RegWrite4 <= RegWrite3;
      MemoryReadData2 <= MemoryReadData;
      AluOut3 <= AluOut2;
      RegDst3 <= RegDst2;
    end
    else begin 
      MemToReg4 <= MemToReg4;
      RegWrite4 <= RegWrite4;
      MemoryReadData2 <= MemoryReadData2;
      AluOut3 <= AluOut3;
      RegDst3 <= RegDst3;
    end
  end
  
endmodule 




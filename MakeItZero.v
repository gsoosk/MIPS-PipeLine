module MakeItZero(input  Change1, ConstEnable1, input [3:0] AluOp1, input MemRead1, MemWrite1,input MemToReg1, RegWrite1,
                  input HazardSel, output reg Change1_2, ConstEnable1_2, output reg [3:0] AluOp1_2, output reg MemRead1_2, MemWrite1_2,output reg MemToReg1_2, RegWrite1_2);
  always@(*) begin
    if(HazardSel)
      begin 
        Change1_2 <= 0;
        ConstEnable1_2 <= 0;
        AluOp1_2 <= 0;
        MemRead1_2 <= 0;
        MemWrite1_2 <= 0;
        MemToReg1_2 <= 0;
        RegWrite1_2 <= 0;  
      end
    else
      begin
        Change1_2 <= Change1;
        ConstEnable1_2 <= ConstEnable1;
        AluOp1_2 <= AluOp1;
        MemRead1_2 <= MemRead1;
        MemWrite1_2 <= MemWrite1;
        MemToReg1_2 <= MemToReg1;
        RegWrite1_2 <= RegWrite1; 
      end
  end
  
endmodule
              

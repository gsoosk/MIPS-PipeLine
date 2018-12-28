module ForwardingUnit(input [2:0] R1, R2, input RegWrite3, RegWrite4, MemToReg4, input [2:0] RegDst2, RegDst3, output reg [1:0] ForwardA, ForwardB);
  
  always@(*) begin
  ForwardA <= 0;
  ForwardB <= 0;
  if(RegWrite4)
  begin
   if(R1 == RegDst3)
     ForwardA <= 2'd2;
   if(R2 == RegDst3)
     ForwardB <= 2'd2;
  end
  if(RegWrite3 &( R1 == RegDst2 | R2 == RegDst2) )begin
    ForwardA <= 0;
    ForwardB <= 0;
    if(R1 == RegDst2)
      ForwardA <= 2'd1;
    if(R2 == RegDst2)
      ForwardB <= 2'd1;
  end
  end
endmodule 

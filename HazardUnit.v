module HazardUnit(input MemRead2, input[2:0] R, R1, R2, output reg HazardSel, NW, PcNotWrite);
  always@(MemRead2, R, R1, R2) begin
    HazardSel = 1'b0;
    NW = 1'b0;
    PcNotWrite = 1'b0;
    if(MemRead2 & ((R == R1) | (R == R2)))
    begin
      HazardSel = 1'b1;
      NW = 1'b1;
      PcNotWrite = 1'b1;
    end
        
  end
endmodule
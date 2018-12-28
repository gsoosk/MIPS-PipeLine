module TB();
 reg clk = 0;
 reg rst = 0;
 initial begin
  #15 rst = 1;
  #17 rst = 0;
  repeat(400) #10 clk = ~clk;
 end
 CPU cpu(clk,rst);
endmodule

module flipFlop(input clk, rst, in, Change, output reg q );
  always@(negedge clk, posedge rst)begin 
    if(rst)
      q <= 1'b0;
    else begin
      
if(Change == 1)
      
  q <= in;
    end
  end
  
endmodule 

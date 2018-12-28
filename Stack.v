module Stack (input clk ,rst, push,pop, input [11:0] StackWrite, output reg [11:0] StackRead);
	reg [3:0] ptr;
	reg [11:0] stack [7:0];
	always @(negedge clk, posedge rst) begin
		if (rst)
			ptr <= 0;
		if (push) begin
			ptr <= ptr + 1;
			stack[ptr] <= StackWrite;
			end
	end
	always @(posedge clk) begin
	  StackRead <= stack[ptr - 1];
	  		if (pop) begin
		    
			   ptr <= ptr - 1;
			end
		end
endmodule

module StackTestBench();
  reg clk = 0;
  reg rst = 0;
  initial repeat(210) #10 clk = ~clk;
  initial begin
    #1 rst = 1;
    #2 rst = 0;
  end
  reg [11:0] Data;
  reg push;
  reg pop;
  wire [11:0] out;
  initial push = 0;
  initial pop = 0;
  initial begin
    #10 Data = 12'd1;
    #0 push = 1'b1;
    #40 Data = 12'd2;
    #20 push = 1'b0;
    #10 pop = 1'b1;
      
  end
  Stack
   stack(clk, rst, push, pop, Data, out);
endmodule
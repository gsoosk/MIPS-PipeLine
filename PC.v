module PC(input clk, rst, input  [11:0] PCin, input Halt, PcNotWrite, output reg [11:0]PCout);
	always @(posedge clk, posedge rst) begin
		if (rst == 1)
			PCout <= 1'b0;
		else
		  if(Halt)
		    PCout <= PCout;
		  else if(PcNotWrite)
		    PCout <= PCout;
		  else
			  PCout <= PCin + 1;
	end
endmodule

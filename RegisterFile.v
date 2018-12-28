module RegisterFile(input [2:0] ReadReg1, ReadReg2, WriteReg, input [7:0] WriteData, input clk, RegWrite,
  output [7:0] ReadData1, ReadData2);

	reg [7:0] Memory [0:7];
	initial Memory[0] <= 0;
	initial Memory[1] <= 8'd12;
	initial Memory[2] <= 8'd13;
	initial Memory[4] <= 8'd43;
	initial Memory[5] <= 8'd3;
	

	assign ReadData1 = Memory[ReadReg1];
	assign ReadData2 = Memory[ReadReg2];

	always @(negedge clk)
		if (RegWrite == 1)
			Memory[WriteReg] = WriteData;
	
endmodule

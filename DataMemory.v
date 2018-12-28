module DataMemory (input [7:0] WriteData, input [7:0] Address, input clk, MemWrite, MemRead,
  output reg [7:0] ReadData);
	reg [7:0] Memory[0:255];
  initial begin
    //Test case 1
   /* Memory[100] <= 114; // for testcase 1
    Memory[102] <= 213; // for testcase 1
    
    Memory[101] <= 6;  //for testcase 1
    Memory[103] <= 14;  //for testcase 1
    //ans : 0001 0101 0100 0111
    */
    
    
   
    //Test case 2
    
    Memory[100] <= 1;
    Memory[101] <= 2;
    Memory[102] <= 4;
    Memory[103] <= 7;
    Memory[104] <= 14;
    Memory[105] <= 3;
    Memory[106] <= 78;
    Memory[107] <= 20;
    Memory[108] <= 85;
    Memory[109] <= 95;
    Memory[110] <= 105;
    Memory[111] <= 13;
    Memory[112] <= 9;
    Memory[113] <= 45;
    Memory[114] <= 75;
    Memory[115] <= 13;
    Memory[116] <= 90;
    Memory[117] <= 45;
    Memory[118] <= 101;
    Memory[119] <= 76;
    // ans = 0110 1001
        
  end
	always @ (posedge clk) begin
		if (MemWrite == 1)
			Memory[Address[7:0]] <= WriteData;
	end

	always @(negedge clk) begin
		if (MemRead == 1)
			ReadData <= Memory[Address[7:0]];
	end
endmodule

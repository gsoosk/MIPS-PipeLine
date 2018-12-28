module ALU (input[18:0] Instruction, input [3:0] ALUOperation, input [7:0] A, B, input cin,
  output reg [7:0] Y, output Zero ,output reg cout);

  initial begin
    cout = 0;
  end

  reg[2:0] sc;
  reg[7:0] temp;

	always @(ALUOperation, A, B) begin
    sc <= Instruction[7:5] + 3'b001;
		case (ALUOperation)
			4'b0000: {cout,Y} <= A + B;
			4'b0001: {cout,Y} <= A + B + cin;
			4'b0010: {cout,Y} <= A - B;
			4'b0011: {cout,Y} <= A - B - cin;
			4'b0100: Y <= A & B;
			4'b0101: Y <= A | B;
      4'b0110: Y <= A ^ B;
      4'b0111: Y <= ~(A & B);
	    4'b1000: begin
                Y = A;
                while(sc > 0) begin
                  sc = sc - 1;
                  Y = {Y[6:0],1'b0};
                end
                temp = Y;
              end
    4'b1001: begin
            Y = A;
            while(sc > 0) begin
              sc = sc - 1;
              Y = {1'b0,Y[7:1]};
            end
          end
    4'b1010: begin
            Y = A;
            while(sc > 0) begin
              sc = sc - 1;
              Y = {Y[6:0],Y[7]};
            end
          end
    4'b1011: begin
              Y = A;
              while(sc > 0) begin
                sc = sc - 1;
                Y = {Y[0],Y[7:1]};
              end
            end
  endcase
  end
  assign Zero = (Y == 0);

endmodule

module InstructionMemory(input [11:0] PCout, output reg [18:0] InsOut);
  always @ (PCout) begin
  /*  if(PCout == 0)       InsOut <= 19'b0000001100101000000; // ADD R3 R1,R2
    else if(PCout == 1)  InsOut <= 19'b1000110100000000001; // STM R5, R0, 1
    else if(PCout == 2)  InsOut <= 19'b1000011100000000001; // LDM R7, R0, 1
   // else if(PCout == 3)  InsOut <= 19'b0000001110110000000; // ADD R3 R5,R4
   // else if(PCout == 4)  InsOut <= 19'b0000001110110000000; // ADD R3 R5,R4
    else if(PCout == 3)  InsOut <= 19'b0000011011110000000; // ADD R6 R7,R4
    else if(PCout == 4)  InsOut <= 19'b0000001110110000000; // ADD R3 R5,R4
    //if(PCout == 2)  InsOut <= 19'b0000011010010100000; // ADD R6 R4,R5
    //if(PCout == 2)  InsOut <= 19'b0001001101101000000;
    //if(PCout == 3)  InsOut <= 19'b0100010001100011001;
    //else if(PCout == 1)  InsOut <= 19'b1100111010001100000; //SHL R6 R4,3
    //if(PCout == 5)  InsOut <= 19'b1101111001110000000;
    //else if(PCout == 2)  InsOut <= 19'b1000110100000000001; // STM R5, R0, 1 
    //else if(PCout == 3)  InsOut <= 19'b1000011100000000001; // LDM R7, R0, 1
    //if(PCout == 8)  InsOut <= 19'b1010111111100000001;
    //else if(PCout == 4)  InsOut <= 19'b1110111000000000001; // JMP 1
    //if(PCout == 9)  InsOut <= 19'b1110111000000001100;//jmp to 
    //if(PCout == 10)  InsOut <= 19'b0000001100101000000;//tmp
    //if(PCout == 11)  InsOut <= 19'b0000001100101000000;//tmp
    //if(PCout == 12)  InsOut <= 19'b0000001100101000000;//tmp
    //if(PCout == 13) InsOut <= 19'b1111001111111111111;//return to 10
    //if(PCout == 14) InsOut <= 19'b1010101010101010101;
    else InsOut<= 19'b1111111111111111111;*/
    
    //Test Case 1: 
    /*if(PCout == 0) InsOut <= 19'b1000000100001100100;
    else  if(PCout == 1) InsOut <= 19'b1000001000001100110;
    else if(PCout == 2) InsOut <= 19'b0000001100101011111;
    else if(PCout == 3) InsOut <= 19'b1000101100001101000;
    else if(PCout == 4) InsOut <= 19'b1000000100001100101;
    else if(PCout == 5) InsOut <= 19'b1000001000001100111;
    else if(PCout == 6) InsOut <= 19'b0000101100101011111;
    else if(PCout == 7) InsOut <= 19'b1000101100001101001;
    else if(PCout == 8) InsOut <= 19'b1111111111111111111;*/
    //TestCase 2:
    if(PCout == 1) InsOut <= 19'b0000011100000011111;
    if(PCout == 2) InsOut <= 19'b0000000100000000000;
    if(PCout == 3) InsOut <= 19'b0101001100100010100;
    if(PCout == 4) InsOut <= 19'b1010011111100000110;
    if(PCout == 5) InsOut <= 19'b1000001000101100100;
    if(PCout == 6) InsOut <= 19'b0001001111101011111;
    if(PCout == 7) InsOut <= 19'b1011100000000000001;
    if(PCout == 8) InsOut <= 19'b0000011101000011111;
    if(PCout == 9) InsOut <= 19'b0100000100100000001;
    if(PCout == 10) InsOut<= 19'b1110011000000000011;
    if(PCout == 11) InsOut<= 19'b1111111111111111111;
    
  end
endmodule

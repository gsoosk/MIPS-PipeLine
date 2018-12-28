module Datapath(input clk, rst , RegWrite, ConstEnable,MemWrite, MemRead, MemToReg, RegTwoAddr, Branch, JumpSel, Change, push, pop, StackSel, Halt, input [3:0] AluOp, output [18:0] InstructionOut);
  
  
  wire [11:0] PCin;
  wire [11:0] PCout, PCout2;
  wire [11:0] StackOut;
  wire [18:0] InsOut, InsOut2, InsOut3; assign InstructionOut = InsOut;
  wire [7:0] ReadData1, ReadData2, AluSecondInput, WriteData, AluOut, AluOut2, AluOut3, DataMemoryReadData, DataMemoryReadData2;  
  wire Zin, Cin;
  wire Zout, Cout;assign carryOut = Cout; assign Zero = Zout;
  wire [11:0] PcAfterBranch; 
  wire [11:0] PcBeforeJump; 
  wire [11:0] PcAfterJump; 
  wire BranchSel;
  wire [2:0] RegDst, RegDst2, RegDst3; assign RegDst = InsOut3[13:11];
  wire RegWrite1, RegWrite2, RegWrite3, RegWrite4;
  wire MemToReg1, MemToReg2, MemToReg3, MemToReg4;
  wire Branch1, Change1, ConstEnable1; wire [3:0] AluOp1;
  wire Change2, ConstEnable2; wire[3:0] AluOp2;
  wire MemRead1, MemWrite1,MemRead2, MemWrite2, MemRead3, MemWrite3;
  wire [7:0] ReadData1_2, ReadData2_2, ReadData2_3;
  wire RegTwoAddr1;
  wire [7:0] AluA, AluB;
  wire [1:0] ForwardA, ForwardB;
  wire [2:0] R1, R2;
  wire [2:0] ReadReg2;
  wire PcNotWrite, NW, HazardSel;
  wire Change1_2, ConstEnable1_2;wire [3:0] AluOp1_2;wire MemRead1_2, MemWrite1_2;wire MemToReg1_2, RegWrite1_2;
  wire Flush;
  wire ZBranchLogicIn , CBranchLogicIn;
  
  
  assign PcBeforeJump = (BranchSel == 1'b1 )? PcAfterBranch : PCout; 
  assign PcAfterJump = JumpSel ? InsOut[11:0] - 1  : PcBeforeJump;
  assign PCin = StackSel ?  StackOut : PcAfterJump; 
  PC Pc(clk,rst,PCin, Halt, PcNotWrite, PCout);
  InstructionMemory InsMem(PCout,InsOut); 
  Stack stack(clk, rst, push, pop, PCout,StackOut);
  ControlHazard controlHazard(BranchSel, Flush);
//_____________________________________________________________________________________________________________
  IF_ID If_Id(clk, rst, Flush, NW, PCout, InsOut ,Branch, Change, ConstEnable, AluOp, MemRead, MemWrite, MemToReg, RegWrite, RegTwoAddr,
              PCout2, InsOut2, Branch1, Change1, ConstEnable1, AluOp1, MemRead1, MemWrite1, MemToReg1, RegWrite1, RegTwoAddr1);
//_____________________________________________________________________________________________________________

  assign ReadReg2 = RegTwoAddr1 ? InsOut2[13:11] : InsOut2[7:5];
  RegisterFile RegFile(InsOut2[10:8], ReadReg2, RegDst3, WriteData, clk, RegWrite4, ReadData1, ReadData2);
  HazardUnit hazardUnit(MemRead2, InsOut3[13:11], ReadReg2, InsOut2[10:8], HazardSel, NW, PcNotWrite);
  MakeItZero makeItZero( Change1, ConstEnable1, AluOp1, MemRead1, MemWrite1,MemToReg1, RegWrite1,HazardSel, 
                         Change1_2, ConstEnable1_2, AluOp1_2,  MemRead1_2, MemWrite1_2,MemToReg1_2, RegWrite1_2);
  assign ZBranchLogicIn = Change2 ? Zin : Zout;
  assign CBranchLogicIn = Change2 ? Cin : Cout;
  BranchLogic branchLog(InsOut2[15:14], Branch1, ZBranchLogicIn, CBranchLogicIn ,BranchSel);
  assign PcAfterBranch = {4'b0000, InsOut2[7:0]} + PCout2; 

  
//_____________________________________________________________________________________________________________
  ID_EX Id_Ex(clk, rst, InsOut2, Change1_2, ConstEnable1_2, AluOp1_2, MemRead1_2, MemWrite1_2, MemToReg1_2, RegWrite1_2, ReadData1,
              ReadData2, InsOut2[10:8], ReadReg2, InsOut3, Change2, ConstEnable2, AluOp2, MemRead2, MemWrite2, MemToReg2, RegWrite2,
              ReadData1_2, ReadData2_2, R1, R2);
//_____________________________________________________________________________________________________________

  assign AluSecondInput = ConstEnable2 ? InsOut3[7:0] : AluB;
  ALU Alu(InsOut3, AluOp2, AluA, AluSecondInput, Cout, AluOut, Zin, Cin);
  flipFlop Z(clk, rst, Zin, Change2, Zout);
  flipFlop C(clk, rst, Cin, Change2, Cout);
  
  ForwardingUnit forwardUnit(R1, R2, RegWrite3, RegWrite4, MemToReg4,  RegDst2, RegDst3, ForwardA, ForwardB);
  assign AluA = (ForwardA == 0) ? ReadData1_2 : (ForwardA == 1) ? AluOut2 : WriteData;
  assign AluB = (ForwardB == 0) ? ReadData2_2 : (ForwardB == 1) ? AluOut2 : WriteData; 

//_____________________________________________________________________________________________________________
  EX_MEM Ex_Mem(clk, rst,  MemRead2, MemWrite2, MemToReg2, RegWrite2,  AluB, AluOut, RegDst, MemRead3, MemWrite3,
                MemToReg3, RegWrite3, ReadData2_3, AluOut2, RegDst2);
//_____________________________________________________________________________________________________________


  DataMemory dataMemory(ReadData2_3, AluOut2, clk, MemWrite3, MemRead3, DataMemoryReadData);
  
//_____________________________________________________________________________________________________________
  MEM_WB Mem_Wb(clk, rst, MemToReg3, RegWrite3,  DataMemoryReadData, AluOut2, RegDst2, MemToReg4, RegWrite4, DataMemoryReadData2,
                AluOut3, RegDst3);
//_____________________________________________________________________________________________________________
  
  assign WriteData = MemToReg4 ? DataMemoryReadData2 : AluOut3;
  
  
  
endmodule

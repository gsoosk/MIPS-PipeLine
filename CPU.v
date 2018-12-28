module CPU(input clk, rst);
  wire [18:0] Instruction;
  wire RegWrite, ConstEnable , MemRead, MemWrite, MemToReg, RegTwoAddr, Branch, JumpSel, noChange, push, pop, StackSel;
  wire [3:0] ALUOperation;
  Contoller controller(clk, rst, Instruction, RegWrite, ConstEnable, MemRead, MemWrite, MemToReg,RegTwoAddr,Branch, JumpSel, noChange, push, pop, StackSel, Halt, ALUOperation);
  Datapath datapath(clk, rst , RegWrite, ConstEnable,MemWrite, MemRead, MemToReg, RegTwoAddr,Branch, JumpSel, noChange, push, pop, StackSel, Halt,ALUOperation, Instruction);
endmodule

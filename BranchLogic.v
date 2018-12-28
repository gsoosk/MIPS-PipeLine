module BranchLogic(input [1:0] fn, input Branch, Zout, Cout, output BranchSel);
  wire BZ, BNZ, BC, BNC;
  and(BZ, ~fn[0], ~fn[1], Branch, Zout);
  and(BNZ, fn[0], ~fn[1], Branch, ~Zout);
  and(BC, ~fn[0], fn[1], Branch, Cout);
  and(BNC, fn[0], fn[1], Branch, ~Cout);
  or(BranchSel, BZ, BNZ, BC, BNC);
endmodule
module t01sop();

  wire out0,out1,out2,out3,out4,out5,out6,out7,out8;
  reg A,B,C;

  not G1(out1,A);
  not G2(out2,B);
  not G3(out3,C);
  and G4(out4,out1,out2,out3);
  and G5(out5,out1,B,out3);
  and G6(out6,A,out2,out3);
  and G7(out7,A,out2,C);
  and G8(out8,A,B,C);
  or  G9(out0,out4,out5,out6,out7,out8);

  initial begin
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", A, B, C, out0);
    A = 0; B = 0; C = 0;
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 B = 1; C = 1;
    #1 A = 1; B = 0; C = 0;
    #1 A = 1; B = 0; C = 1;
    #1 A = 1; B = 1; C = 0;
    #1 A = 1; B = 1; C = 1;
    #1 $finish;
  end

  initial begin
    $dumpfile("t01sop_tb.vcd");
    $dumpvars(0, t01sop);
  end
endmodule

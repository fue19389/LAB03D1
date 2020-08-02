module t02pos();

  wire out0,out1,out2,out3,out4,out5,out6;
  reg A,B,C;

  not G1(out1,A);
  not G2(out2,B);
  not G3(out3,C);
  or  G4(out4,A,B,C);
  or  G5(out5,A,out2,C);
  or  G6(out6,A,out2,out3);
  or  G7(out7,out1,B,C);
  or  G8(out8,out1,B,out3);
  and G0(out0,out4,out5,out6,out7,out8);

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
    $dumpfile("t02pos_tb.vcd");
    $dumpvars(0, t02pos);
  end
endmodule

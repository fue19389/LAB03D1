module t04pos();

  wire out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13;
  reg A,B,C,D;

  not G1(out1,A);
  not G2(out2,B);
  not G3(out3,C);
  not G4(out4,D);
  or  G5(out5,A,B,C,out4);
  or  G6(out6,A,out2,C,D);
  or  G7(out7,A,out2,C,out4);
  or  G8(out8,out1,B,C,out4);
  or  G9(out9,out1,B,out3,out4);
  or  G10(out10,out1,out2,C,D);
  or  G11(out11,out1,out2,C,out4);
  or  G12(out12,out1,out2,out3,D);
  or  G13(out13,out1,out2,out3,out4);
  and G0(out0,out5,out6,out7,out8,out9,out10,out11,out12,out13);

  initial begin
    $display("A B C D | Y");
    $display("--------|--");
    $monitor("%b %b %b %b | %b", A, B, C, D, out0);
    A = 0; B = 0; C = 0; D = 0;
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 C = 1; D = 1;
    #1 B = 1; C = 0; D = 0;
    #1 B = 1; C = 0; D = 1;
    #1 B = 1; C = 1; D = 0;
    #1 B = 1; C = 1; D = 1;
    #1 A = 1; B = 0; C = 0; D = 0;
    #1 A = 1; B = 0; C = 0; D = 1;
    #1 A = 1; B = 0; C = 1; D = 0;
    #1 A = 1; B = 0; C = 1; D = 1;
    #1 A = 1; B = 1; C = 0; D = 0;
    #1 A = 1; B = 1; C = 0; D = 1;
    #1 A = 1; B = 1; C = 1; D = 0;
    #1 A = 1; B = 1; C = 1; D = 1;
    #1 $finish;
  end

  initial begin
    $dumpfile("t04pos_tb.vcd");
    $dumpvars(0, t04pos);
  end
endmodule

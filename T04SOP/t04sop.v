module t04sop();

  wire out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11;
  reg A,B,C,D;

  not G1(out1,A);
  not G2(out2,B);
  not G3(out3,C);
  not G4(out4,D);
  and G5(out5,out1,out2,out3,out4);
  and G6(out6,out1,out2,C,out4);
  and G7(out7,out1,out2,C,D);
  and G8(out8,out1,B,C,out4);
  and G9(out9,out1,B,C,D);
  and G10(out10,A,out2,out3,out4);
  and G11(out11,A,out2,C,out4);
  or  G0(out0,out5,out6,out7,out8,out9,out10,out11);

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
    $dumpfile("t04sop_tb.vcd");
    $dumpvars(0, t04sop);
  end
endmodule

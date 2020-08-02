module t01pos();

  wire out0,out1,out2,out3,out4,out5,out6;
  reg A,B,C,D;

  not G4(out4,A);
  not G5(out5,B);
  not G6(out6,C);
  or  G1(out1,A,B,out6);
  or  G2(out2,A,out5,out6);
  or  G3(out3,out4,out5,C);
  and G0(out0,out1,out2,out3);

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
/*
  initial begin //hola
    $dumpfile("t01pos_tb.vcd");
    $dumpvars(0, t01pos);
  end
*/
endmodule

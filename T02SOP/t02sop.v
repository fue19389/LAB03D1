module t02sop();

  wire out0,out1,out2,out3,out4,out5,out6;
  reg A,B,C;

  not G1(out1,A);
  not G2(out2,B);
  not G3(out3,C);
  and G4(out4,out1,out2,C);
  and G5(out5,A,B,out3);
  and G6(out6,A,B,C);
  or  G7(out0,out4,out5,out6);


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
    $dumpfile("t02sop_tb.vcd");
    $dumpvars(0, t02sop);
  end
endmodule

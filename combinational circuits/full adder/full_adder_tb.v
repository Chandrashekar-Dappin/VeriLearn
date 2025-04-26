module full_adder_tb;
  reg a,b,c;
  wire s,cout;

  full_adder dut(a,b,c,s,cout);

  initial begin
    a=0; b=0; c=0;
    #5 a=0; b=0; c=1;
    #5 a=0; b=1; c=0;
    #5 a=0; b=1; c=1;
    #5 a=1; b=0; c=0;
    #5 a=1; b=0; c=1;
    #5 a=1; b=1; c=0;
    #5 a=1; b=1; c=1;

  end

endmodule

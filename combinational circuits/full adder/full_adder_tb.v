module full_adder_tb;
  reg a,b,c;
  wire s,cout;

  full_adder dut(a,b,c,s,cout);  // instantiating the design 

  initial begin           //generating stimulus
    a=0; b=0; c=0;
    #5 a=0; b=0; c=1;
    #5 a=0; b=1; c=0;
    #5 a=0; b=1; c=1;
    #5 a=1; b=0; c=0;
    #5 a=1; b=0; c=1;
    #5 a=1; b=1; c=0;
    #5 a=1; b=1; c=1;

  end

  initial begin
    $monitor("a=%0d, b=%0d, c=%0d, s=%0d, cout=%0d",a,b,c,s,cout);
  end

  initial begin
    $dumpfile("dump.vcd");        // for analysing waveform
    $dumpvars(1,a,b,c,s,cout);
  end

endmodule

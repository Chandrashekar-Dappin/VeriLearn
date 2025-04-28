module test;
  reg clk;
  real freq = 100;  // in MHz
  real time_period;
  
  initial begin
    clk=0;
    time_period = 1000/freq;   //in ns
    #100 $finish;
  end
  
  always # (time_period/2) clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule

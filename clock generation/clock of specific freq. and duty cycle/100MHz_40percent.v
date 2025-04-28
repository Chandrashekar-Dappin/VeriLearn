
module test;
  reg clk;
  real freq = 100;  // in MHz
  real time_period;
  real duty = 40;   // 40% duty cycle
  real ton;
  
  
  initial begin
    clk=0;
    time_period = 1000/freq;   //in ns
    ton = (time_period*duty)/100;
    #100 $finish;
  end
  
  always begin
    #(time_period-ton) clk=0;
    #(ton) clk=1;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end

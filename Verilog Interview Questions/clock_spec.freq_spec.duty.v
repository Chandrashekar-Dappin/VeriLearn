module tb;
  
  reg clk;
  
  real freq = 100;   //in MHz
  real time_period;
  real duty = 40;   //in percent
  real ton;
  
  initial begin
    clk = 0;
   
    time_period = 1000/freq;
    ton = (duty*time_period)/100;
    
  end
  
  always begin
    #(time_period - ton) clk=1;
    #ton clk=0;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,clk);
    #100 $finish;
  end
  
endmodule

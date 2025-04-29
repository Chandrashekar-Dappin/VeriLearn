module test;
  reg clk1,clk2;
  real time_period = 20;  //20ns
  
  initial begin
    clk1=0;
    clk2=0;
    #100 $finish;
  end
  
  always #(time_period/2) clk1=~clk1;
  
  always@(clk1)
    #5 clk2=clk1;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test); 
  end
endmodule

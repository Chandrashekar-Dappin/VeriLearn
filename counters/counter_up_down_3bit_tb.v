module test;
  reg clk,rst,ctrl;
  wire [2:0] count;
  
  counter_up_down_3bit dut(clk,rst,ctrl,count);
  
  initial begin
    clk=0;
    rst=1;
    #10 rst=0;
    ctrl=1;
    #60 ctrl=0;
    #40 ctrl=1;
    #20 ctrl=0;
    #150 $finish;
  end
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule
    
  

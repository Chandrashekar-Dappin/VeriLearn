module test;
  reg clk,rst;
  wire [2:0] count;
  
  counter_up_down_3bit dut(clk,rst,count);
  
  initial begin
    clk=0;
    rst=1;
    #10 rst=0;
    #150 $finish;
  end
  
  always #2.5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule
    
  

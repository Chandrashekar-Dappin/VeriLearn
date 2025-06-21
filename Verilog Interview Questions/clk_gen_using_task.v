module clkk(input rst,output clk);
  reg int_clk;
  assign clk = int_clk;
  
  task clk_gen();
    if(rst)
      int_clk = 0;
    
    else
      int_clk = ~int_clk;
    
  endtask
  
  always begin
    clk_gen();
    #5;
  end
  
  
endmodule
    


module tb;
  reg rst;
  wire clk;
  
  clkk dut(rst,clk);
  
  initial begin
    rst = 1;
    #10 rst= 0;
  end
  
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100 $finish;
  end
  
endmodule

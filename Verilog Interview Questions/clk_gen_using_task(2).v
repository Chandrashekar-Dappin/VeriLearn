
module tb;
  
  reg clk = 0;
  
  task clkk();
    
    forever #5 clk = ~clk;

  endtask
  
  initial begin
  fork
    
    clkk();
    
  join_none
    
  #100 $finish();
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end
  
endmodule

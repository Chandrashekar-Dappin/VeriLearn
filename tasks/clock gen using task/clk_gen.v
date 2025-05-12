module clk_gen(input rst, output clk);
  reg int_clk;
  
  assign clk = int_clk;
  
  task clk_genr ();
    begin
      if(rst)
        int_clk=0;
      
      else
        int_clk = ~int_clk;
      
    end
  endtask
  
  always begin
    clk_genr();
    #2;
  end
  
  initial begin
    #100 $finish;
  end
  
endmodule

// Test bench
module clk_gen_tb;
  reg rst;
  wire clk;
  
  clk_gen dut(rst, clk);
  
  initial begin
    rst=1;
    #12 rst=0;
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,clk_gen_tb);
  end
  
  
endmodule
    

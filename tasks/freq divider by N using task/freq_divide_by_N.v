module freq_divider #(parameter N=4) (clk_in,rst,clk_out);
  
  input clk_in,rst;
  output reg clk_out;
  int count;
  reg int_clk;
  assign clk_out = int_clk;
  
  task clk_divide();
   
      forever@(posedge clk_in) begin
      if(rst)
        int_clk = 0;
      
      else begin
        count++;
        if(count % N == 0)
          int_clk = ~int_clk;
      end
        
      end
    
  endtask
  
  initial begin
    clk_divide();
  end
  
endmodule
    




module tb;
  defparam dut.N=8;
  reg clk_in,rst;
  wire clk_out;
  
  freq_divider dut(clk_in,rst,clk_out);
  
  initial begin
    
    clk_in <= 0;
    rst <= 1;
    #12 rst <= 0;
    #200 $finish(2);
    
  end
  
  always #5 clk_in <= clk_in ^ 1;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end
  
  
endmodule
    

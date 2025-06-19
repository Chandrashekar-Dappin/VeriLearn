module freq_divide #(parameter N=3) (clk,rst, clk_out);
  
  input clk,rst;
  output reg clk_out;
  
  int count;
  
  always@(posedge clk or posedge rst) begin
    
    if(rst) begin
      count = 0;
      clk_out =0;
    end
    
    else begin
      count = count+1;
      if(count % N == 0)
        clk_out = ~clk_out; //should be non-blocking
    end
    
    end
  
endmodule



module tb;
  reg clk,rst;
  wire clk_out;
  
  freq_divide dut(clk,rst, clk_out);  
  
  initial begin
    clk = 0;
    rst = 1;
    #12 rst = 0;
  end
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
    #200 $finish;
  end
  
endmodule
    
      
  

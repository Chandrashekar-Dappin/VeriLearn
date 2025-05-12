module freq_divide #( parameter N=4) (input clk,rst,output clk_out);
  
  reg int_clk;
  integer count;
  
  assign clk_out = int_clk;
  
  always@(clk) begin
    if(rst) begin
      int_clk=0;
      count=0;
      
    end
    
    else begin
      count=count+1;
      
      if(count%N == 0) begin
        int_clk=~int_clk;
        count=0;
      end
      
    end
    
  end
  
endmodule


//Testbench

module freq_divide_tb;
  
  reg rst,clk;
  wire clk_out;
  
  freq_divide dut(clk,rst,clk_out);
  
  initial begin
    clk=0;
    rst=1;
    #10 rst=0;
    
    #100 $finish;
  end
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,freq_divide_tb);
  end
  
endmodule

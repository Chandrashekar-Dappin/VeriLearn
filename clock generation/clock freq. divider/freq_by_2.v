module clk_divider(clk,rst,clk_out);
  input clk,rst;
  output reg clk_out;
  
   
  
  always@(posedge clk)
    begin
      
    if(rst)
      clk_out<=0;
  
    else
      clk_out<=~clk_out;
      
    end
  

endmodule



module test;
  reg clk,rst;
  wire clk_out;
  
  clk_divider(clk,rst,clk_out);
  
  initial begin
    clk=0;
    rst=1;
    #10 rst=0;
    #100 $finish;
  end
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule

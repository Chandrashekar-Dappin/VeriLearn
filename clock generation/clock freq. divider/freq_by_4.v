module clk_divider(clk,rst,clk2,clk3);
  input clk,rst;
  output reg clk2,clk3;
  
   
  
  always@(posedge clk)
    begin
      
      if(rst)begin
     
      clk2<=0;
      clk3<=0;
      end
     
  
    else
      clk2<=~clk2;
      
    end
  
  always@(posedge clk2)
    begin
        clk3<=~clk3;
    end
  
      
  

endmodule



module test;
  reg clk,rst;
  wire clk2,clk3;
  
  clk_divider(clk,rst,clk2,clk3);
  
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
  
  

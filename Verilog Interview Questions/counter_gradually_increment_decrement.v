module counter(clk,rst,count);
  input clk,rst;
  output reg [2:0] count;
  reg ctrl;
  
  always@(posedge clk) begin
    if(rst) begin
      count <= 0;
      ctrl <= 1;
    end
    
    else
      if(ctrl) 
        if(count == 7) begin
          ctrl <= 0;
          count <= count-1;
        end
        
        else
          count <= count +1;
     
    
      else
        if(count == 0)begin
          ctrl <= 1;
          count <= count+1;
        end
    
        else
          count <= count-1;
    
  end
   
  
endmodule



module tb;
  reg clk,rst;
  wire [2:0] count;
  
  counter(clk,rst,count);
  
  initial begin
    clk=0;
    rst=1;
    #13 rst=0;
  end
  
  always #2 clk <= ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
    #100 $finish;
  end
  
endmodule


    
      
  
  
    

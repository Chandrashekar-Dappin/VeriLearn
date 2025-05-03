module counter_mod10(clk,rst,count);
  input clk,rst;
  output reg [3:0] count;
  reg [3:0]temp;
  
  always@(posedge clk)
    begin
      if(rst) 
        temp<=0;
      
      else begin
        temp<=temp+1;
        if(temp>=9)
          temp<=0;
      end
      
      
      
        
      
      count<=temp;
      
    end

module counter_mod_100 (clk,rst,count); 
  input clk,rst; 
  output reg [6:0] count; 
  reg [6:0] temp; 
   
   
  always@(posedge clk) 
    begin 
       
      if (rst) 
        temp<=0; 
   
      else if(temp>=99) 
        temp <=0; 
       
      else 
        temp<=temp+1; 
       
      count<=temp; 
       
    end 
   
endmodule 

module tlatch(t,clk,rst,q);
  input clk,rst,t;
  output reg q;
  reg temp;
  
  always@(clk,rst,t)
    begin
      if(clk)
        if(rst)
          temp<=0;
        else
          if(t)
            temp<=~temp;
          else
            temp<=~temp;
      
      q<=temp;       
     
    end
  
endmodule

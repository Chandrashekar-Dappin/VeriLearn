module jklatch(j,k,clk,rst,q);
  input clk,rst,j,k;
  output reg q;
  reg temp;
  
  always@(clk,rst,j,k)
    begin
      if(rst)
        temp<=0;
      
      else
        if(clk)
          if(!j)
            if(!k)
              temp<=temp;
            else
              temp<=0;
          else
            if(!k)
              temp<=1;
            else
              temp<=~temp;
      
      q<=temp;
    
    end
  
endmodule
      

module dlatch(d,clk,rst,q);
  input clk,rst,d;
  output reg q;
  
  always@(clk,rst,d)
    begin
      if(rst)
        q<=0;
      else
        if(clk)
          q<=d;
    end
endmodule
      

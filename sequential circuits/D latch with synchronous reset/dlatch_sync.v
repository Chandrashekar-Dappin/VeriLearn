module dlatch(d,clk,rst,q);
  input clk,rst,d;
  output reg q;
  
  always@(clk,rst,d)
    begin
      if(clk)
        if(rst)
          q<=0;
        else
          q<=d;
      else
        q<=q;

    end
endmodule

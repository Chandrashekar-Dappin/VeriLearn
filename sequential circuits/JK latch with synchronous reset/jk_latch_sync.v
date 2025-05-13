module jk_latch_async(j,k,clk,rst,q);
  input j,k,clk,rst;
  output q;
  reg temp;
  
  assign q = temp;
  
  always@(j,k,rst,clk) begin
    if(clk)
      if(rst)
        temp<=0;
    
      else
        if(j==0 & k==0)
          temp<=temp;
        else if(j==0 & k==1)
          temp<=0;
        else if(j==1 & k==0)
          temp<=1; 
        else
          temp<=~temp;
    
    else
      temp<=temp;
    
  end
  
endmodule

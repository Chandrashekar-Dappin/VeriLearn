module jk_ff_async(j,k,clk,rst,q);
  input j,k,clk,rst;
  output q;
  reg temp;
  
  assign q = temp;
  
  always@(posedge clk or posedge rst) begin
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
      
  end

  
endmodule

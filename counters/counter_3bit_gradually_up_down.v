module counter_up_down_3bit_gradually(clk,rst,count);
  input clk,rst;
  output reg [2:0] count;
  reg ctrl;
  
  always@(posedge clk)
    begin
      if(rst) begin
        count<=0;
        ctrl<=1;
      end
      
      else 
        if(ctrl)
          if(count==7) begin
            ctrl<=0;
            count<=count-1;
          end
         
          else
            count<=count+1;
      
        
        else
          if(count==0) begin
            ctrl<=1;
            count<=count+1;
          end
        
          else
            count<=count-1;
    end    

  
  
endmodule

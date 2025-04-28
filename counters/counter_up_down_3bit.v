module counter_up_down_3bit(clk,rst,ctrl,count);
  input clk,rst,ctrl;
  output [2:0] count;
  reg [2:0] temp;
  
  always@(posedge clk)
    begin
      if(rst)
        temp<=0;
      else
        if(ctrl)
          temp<=temp+1;
        else
          temp<=temp-1;
    end
  
  assign count = temp;
  
endmodule

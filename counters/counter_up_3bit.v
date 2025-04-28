module counter_up_3bit(clk,rst,count);
  input clk,rst;
  output [2:0] count;
  reg [2:0] temp;
  
  always@(posedge clk)
    begin
      if(rst)
        temp<=0;
      else
        temp<=temp+1;
    end
  
  assign count = temp;
  
endmodule

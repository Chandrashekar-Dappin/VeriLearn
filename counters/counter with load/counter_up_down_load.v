module counter_up_load(clk,rst,count,load,data,up_down);
  input clk,rst,load,up_down;
  input [5:0] data;
  output [5:0] count;
  reg [5:0] count_temp;
  
  always@(posedge clk)
    begin
      if(rst)
        count_temp<=6'b0;
      
      
      else if(load)
        count_temp<=data;
      
      else if(up_down)
        count_temp<=count_temp+1;
      
      else
        count_temp<=count_temp-1;
      
    end
  assign count=count_temp;
  
endmodule
      

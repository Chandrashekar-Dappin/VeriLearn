```
module universal_shift_reg(clk,rst,sel,serial_in,parallel_in, parallel_out);
  input clk,rst,serial_in;
  input [1:0] sel;
  input [3:0] parallel_in;
  output parallel_out;
  
  always@(posedge clk) begin
    
    if(rst)
      parallel_out <= 4'b0000;
    
    else
      case(sel)
        2'b00: data_out <= data_out;
        2'b01: data_out <= {1'b0,data_out[3:1]};
        2'b10: data_out <= {data_out[2:0],1'b0};
        2'b11: data_out <= data_in;
        default : data_out <= data_out;
      endcase
    
  end
  
endmodule
```

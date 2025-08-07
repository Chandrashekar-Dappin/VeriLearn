## Code
```
module seq_10110_moore_ov(clk,rst,in_seq,det_out);
  
  input clk,rst,in_seq;
  output reg det_out;
  
  reg [2:0] ps,ns;
  
  parameter idle = 3'b000;
  parameter s1 = 3'b001;
  parameter s10 = 3'b010;
  parameter s101 = 3'b011;
  parameter s1011 = 3'b100;
  parameter s10110 = 3'b101;
  
  
  always@(posedge clk or negedge rst) begin
    
    if(!rst)
      ps <= idle;
    
    else
      ps <= ns;
    
  end
  
  
  always@(*) begin
    
    case(ps)
      idle : if(in_seq) begin
               ns = s1;
               det_out = 0;
             end
        
             else begin
               ns = idle;
               det_out = 0;
             end
      
      s1 : if(in_seq) begin
               ns = s1;
               det_out = 0;
             end
        
             else begin
               ns = s10;
               det_out = 0;
             end
      
      s10 : if(in_seq) begin
               ns = s101;
               det_out = 0;
             end
        
             else begin
               ns = idle;
               det_out = 0;
             end
      
      s101 : if(in_seq) begin
               ns = s1011;
               det_out = 0;
             end
        
             else begin
               ns = s10;
               det_out = 0;
             end
      
      s1011 : if(in_seq) begin
               ns = s1;
               det_out = 0;
             end
        
             else begin
               ns = s10110;
               det_out = 0;
             end
      
      s10110 : if(in_seq) begin
               ns = s101;
               det_out = 1;
             end
        
             else begin
               ns = idle;
               det_out = 1;
             end
      
      default : begin
               ns = idle;
               det_out = 0;
             end
      
    endcase
    
  end
  
endmodule




module tb;
  
  reg clk,rst,in_seq;
  wire det_out;
      
  seq_10110_moore_ov dut(clk,rst,in_seq,det_out);    
  
  initial begin
    
    clk = 0;
    rst = 0;
    #15 rst = 1;
    in_seq = 0;
    #10 in_seq = 1;
    #10 in_seq = 0;
    #10 in_seq = 1;
    #10 in_seq = 1;
    #10 in_seq = 0;
    #10 in_seq = 1;
    #10 in_seq = 1;
    #10 in_seq = 0;
    #10 in_seq = 1;
    #10 in_seq = 1;
    #10 in_seq = 0;
    #20 $finish;
  end
  
  always #5 clk = ~clk;
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end
  
endmodule
  
```

## Output
<img width="1796" height="223" alt="image" src="https://github.com/user-attachments/assets/10c567ac-883a-4c81-aded-5ffa555ba3f6" />

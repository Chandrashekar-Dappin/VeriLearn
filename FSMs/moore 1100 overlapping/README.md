## DUT:
```
module seq_det_1100_moore_ov (clk,rst,in_seq, det_out);
  input clk,rst,in_seq;
  output reg det_out;
  
  //5 states 3 bit registers needed
  
  reg [2:0] ps,ns;
  
  // state declaration
  parameter idle = 3'b000;
  parameter s1 = 3'b001;
  parameter s11 = 3'b010;
  parameter s110 = 3'b011;
  parameter s1100 = 3'b100;
  
  //sequential logic
  
  always@(posedge clk) begin
    
    if(rst)
      ps <= idle;
    
    else
      ps <= ns;
    
  end
  
  
  //combinational logic 
  
  always@(ps,in_seq) begin
    
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
        		ns = s11;
        		det_out = 0;
      		 end
      
      		 else begin
               ns = idle;
               det_out = 0;
             end
      
      
      s11 : if(in_seq) begin
        		ns = s11;
        		det_out = 0;
      		 end
      
      		 else begin
               ns = s110;
               det_out = 0;
             end
      
      
      s110 : if(in_seq) begin
        		ns = s1;
        		det_out = 0;
      		 end
      
      		 else begin
               ns = s1100;
               det_out = 0;
             end
      
      s1100 : if(in_seq) begin
        		ns = s1;
        		det_out = 1;
      		 end
      
      		 else begin
               ns = idle;
               det_out = 1;
             end
      
      
      default :begin
        		ns = idle;
        		det_out = 0;
      		   end
      
    endcase
    
  end
  
endmodule
```


## TB:
```
module tb;
  reg clk,rst,in_seq;
  wire det_out;
  
  seq_det_1100_moore_ov dut(clk,rst,in_seq, det_out);
  
  initial begin
    
    clk = 0;
    rst = 1;
    #12 rst = 0;
    
    in_seq =0;
    #10 in_seq =1;
    #10 in_seq =1;
    #10 in_seq =0;
    #10 in_seq =0;
    #10 in_seq =1;
    #10 in_seq =1;
    #10 in_seq =1;
    #10 in_seq =0;
    #10 in_seq =0;
    
    #50 $finish;
    
  end
  
  always #5 clk = ~clk;
  
  initial begin
    $monitor("time : %0t  rst : %b in_seq : %b det_out : %b",$time,rst,in_seq,det_out);
    $dumpfile("dumpfile.vcd");
    $dumpvars(1,tb);
  end
  
endmodule
```    
    
## Output
![Screenshot 2025-07-08 195753](https://github.com/user-attachments/assets/a3230932-404b-4d51-95cc-6cd7dc0f5c63)



















      

      
      
        
        
        
    

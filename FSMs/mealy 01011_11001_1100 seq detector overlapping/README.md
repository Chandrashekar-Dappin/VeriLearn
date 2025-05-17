# Mealy Sequence Detector Overlapping 01011_11001_1100
![WhatsApp Image 2025-05-18 at 00 52 06_044d1851](https://github.com/user-attachments/assets/e271959f-d33e-4c3c-bf01-54ce7bd32cf3)

# Design Code
```
module mealy_seq_01011_11001_1100 (clk,rst,in_seq,det_out);
  input clk,rst,in_seq;
  output reg det_out;
  
  reg [3:0] ps,ns;
  
  parameter idle = 4'b0000;
  parameter s0 = 4'b0001;
  parameter s01 = 4'b0010;
  parameter s010 = 4'b0011;
  parameter s0101 = 4'b0100;
  parameter s1 = 4'b0101;
  parameter s11 = 4'b0110;
  parameter s110 = 4'b0111;
  parameter s1100 = 4'b1000;
  
  
 
  always@(posedge clk) begin
    if(rst)
      ps <= idle;
    
    else
      ps <= ns;
    
  end
  
  
  always@(ps,in_seq) begin
    case(ps)
      idle : if (in_seq == 0)begin
        	   ns = s0;
        	   det_out = 0;
             end
      
      		 else begin
               ns = s1;
               det_out = 0;
             end
      
      s0 : if (in_seq == 0)begin
        	   ns = s0;
        	   det_out = 0;
             end
      
      		 else begin
               ns = s01;
               det_out = 0;
             end
      
      s01 : if (in_seq == 0)begin
        	   ns = s010;
        	   det_out = 0;
             end
      
      		 else begin
               ns = s11;
               det_out = 0;
             end
      
      s010 : if (in_seq == 0)begin
        	   ns = s0;
        	   det_out = 0;
             end
      
      		 else begin
               ns = s0101;
               det_out = 0;
             end
     
      s0101 : if (in_seq == 0)begin
        	   ns = s010;
        	   det_out = 0;
             end
      
      		 else begin
               ns = s11;
               det_out = 1;
             end
      
      s1 : if (in_seq == 0)begin
        	   ns = s0;
        	   det_out = 0;
             end
      
      		 else begin
               ns = s11;
               det_out = 0;
             end
      
      s11 : if (in_seq == 0)begin
        	   ns = s110;
        	   det_out = 0;
             end
      
      		 else begin
               ns = s11;
               det_out = 0;
             end
   
      
      s110 : if (in_seq == 0)begin
        	   ns = s1100;
        	   det_out = 1;
             end
      
      		 else begin
               ns = s01;
               det_out = 0;
             end
      
      s1100 : if (in_seq == 0)begin
        	   ns = s0;
        	   det_out = 0;
             end
      
      		 else begin
               ns = s01;
               det_out = 1;
             end
      
      
      default : begin
        	     ns = idle;
        		 det_out = 0;
                end
      
      
    endcase
    
  end
  
endmodule
```


# Testbench
```

module mealy_seq_01011_11001_1100_tb;
  reg clk,rst,in_seq;
  wire det_out;
  
  mealy_seq_01011_11001_1100 dut(clk,rst,in_seq,det_out);
  
  initial begin
    clk =0 ;
    rst =1;
    #12 rst =0;
    in_seq = 0;
    #10 in_seq = 1;
    #10 in_seq = 0;
    #10 in_seq = 1;
    #10 in_seq = 1;
    #10 in_seq = 0;
    #10 in_seq = 0;
    #10 in_seq = 1;
    #10 in_seq = 0;
    #20 $finish;
    
  end
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,mealy_seq_01011_11001_1100_tb);
    $monitor("Time = %0t | rst = %b | in_seq = %b | det_out = %b",$time,rst,in_seq,det_out);
  end
  
  
endmodule
```

# Output
```
Time = 0 | rst = 1 | in_seq = x | det_out = x
Time = 5 | rst = 1 | in_seq = x | det_out = 0
Time = 12 | rst = 0 | in_seq = 0 | det_out = 0
Time = 22 | rst = 0 | in_seq = 1 | det_out = 0
Time = 32 | rst = 0 | in_seq = 0 | det_out = 0
Time = 42 | rst = 0 | in_seq = 1 | det_out = 0
Time = 45 | rst = 0 | in_seq = 1 | det_out = 1
Time = 55 | rst = 0 | in_seq = 1 | det_out = 0
Time = 62 | rst = 0 | in_seq = 0 | det_out = 0
Time = 65 | rst = 0 | in_seq = 0 | det_out = 1
Time = 75 | rst = 0 | in_seq = 0 | det_out = 0
Time = 82 | rst = 0 | in_seq = 1 | det_out = 1
Time = 85 | rst = 0 | in_seq = 1 | det_out = 0
Time = 92 | rst = 0 | in_seq = 0 | det_out = 0
```
![Screenshot 2025-05-18 003231](https://github.com/user-attachments/assets/f797eafb-b165-4c67-b4ac-7a0a38f2cb29)

  
  
    
        
        
  

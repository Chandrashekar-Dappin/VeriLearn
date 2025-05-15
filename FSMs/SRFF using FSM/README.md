# SRFF State Diagram
![Screenshot 2025-05-15 224435](https://github.com/user-attachments/assets/fafc5c8e-dfb2-40e0-bff1-55fc9b988289)

# Design Code
```

module srff_fsm(clk,rst,s,r,q);
  input clk,rst,s,r;
  output reg q;
  
  reg ps,ns;
  
  parameter s0 = 1'b0;
  parameter s1 = 1'b1;
  
  always@(posedge clk) begin
    if(rst)
      ps <= s0;
    
    else
      ps <= ns;
  end
  
  always@(*) begin
    case(ps)
      s0 : if(s==0 & r==0)
            ns = s0;
      
           else if(s==0 & r==1)  
             ns = s0;
      
           else if(s==1 & r==0)
            ns = s1;
             
      s1 : if(s==0 & r==0)
            ns = s1;
      
           else if(s==1 & r==0)  
             ns = s1;
      
      else if(s==0 & r==1)
             ns = s0;
      
      default : ns = s0;
      
      
    endcase
    
  end
  
  always@(*) begin
    q = ps;
  end
  
  
endmodule
```

# Testbench
```

module srff_fsm_tb;
  reg clk,rst,s,r;
  wire q;
  
  srff_fsm dut(clk,rst,s,r,q);
  
  initial begin
    clk=0;
    rst=1;
    #12 rst=0;
    s=0; r=0;
    #10 r=1;
    #10 s=1; r=0;
    #10 r=1;
    #10 s=0; r=0;
    #10 s=0; r=1;
    #20 $finish;
    
  end
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,srff_fsm_tb);
  end
  
endmodule
```

# Output
![Screenshot 2025-05-15 225750](https://github.com/user-attachments/assets/9bd7d006-a6a4-479e-9cbc-1c45cb93f901)

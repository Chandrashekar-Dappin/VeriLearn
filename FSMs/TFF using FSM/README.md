# DFF State Diagram 
![Screenshot 2025-05-15 224051](https://github.com/user-attachments/assets/ec55c37e-b173-4cd7-942a-e51b08d2ba12)

# Design Code
```

module tff_fsm(clk,rst,t,q);
  input clk,rst,t;
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
      s0 : if(t)
            ns = s1;
      
      	   else
            ns = s0;
             
      s1 : if(t)
            ns = s0;
      
      	   else
            ns = s1;
      
    endcase
    
  end
  
  always@(*) begin
    q = ps;
  end
  
  
endmodule
```

# Testbench
```
module tff_fsm_tb;
  reg clk,rst,t;
  wire q;
  
  tff_fsm dut(clk,rst,t,q);
  
  initial begin
    clk=0;
    rst=1;
    #12 rst=0;
    t=1;
    #10 t=0;
    #10 t=1;
    #10 t=0;
    #10 t=1;
    #20 $finish;
    
  end
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tff_fsm_tb);
  end
  
endmodule
```

# Output
![Screenshot 2025-05-15 223804](https://github.com/user-attachments/assets/62961a00-f988-4452-a79d-d110375bef09)

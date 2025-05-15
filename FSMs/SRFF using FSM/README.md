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
    case (ps)
      s0: begin
        if (s == 0 && r == 0)
          ns = s0;        // hold
        else if (s == 1 && r == 0)
          ns = s1;        // set
        else if (s == 0 && r == 1)
          ns = s0;        // reset again (stay in 0)
        else
          ns = s0;        // invalid: S=1, R=1 → treat as reset or stay
      end

      s1: begin
        if (s == 0 && r == 0)
          ns = s1;        // hold
        else if (s == 1 && r == 0)
          ns = s1;        // set again
        else if (s == 0 && r == 1)
          ns = s0;        // reset
        else
          ns = s0;        // invalid: S=1, R=1 → treat as reset
      end
    endcase
      
      
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
![Screenshot 2025-05-15 230613](https://github.com/user-attachments/assets/1918254c-de0a-46ad-a209-42509b0a428c)


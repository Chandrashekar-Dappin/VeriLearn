# JKFF State Diagram
![Screenshot 2025-05-15 230821](https://github.com/user-attachments/assets/998bc610-f435-447d-adef-ed43fbae35d4)


# Design Code
```
module jkff_fsm(clk,rst,j,k,q);
  input clk,rst,j,k;
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
        if (j == 0 && k == 0)
          ns = s0;        // hold
        else if (j == 1 && k == 0)
          ns = s1;        // set
        else if (j == 0 && k == 1)
          ns = s0;        // reset again (stay in 0)
        else
          ns = s1;        // toggle
      end

      s1: begin
        if (j == 0 && k == 0)
          ns = s1;        // hold
        else if (j == 1 && k == 0)
          ns = s1;        // set again
        else if (j == 0 && k == 1)
          ns = s0;        // reset
        else
          ns = s0;        //toggle
      end
    endcase
    
  end
  
  always@(*) begin
    q = ps;
  end
  
  
endmodule
```

# Testbench
```
module jkff_fsm_tb;
  reg clk,rst,j,k;
  wire q;
  
  jkff_fsm dut(clk,rst,j,k,q);
  
  initial begin
    clk=0;
    rst=1;
    #12 rst=0;
    j=0; k=0;
    #10 k=1;
    #10 j=1; k=0;
    #10 k=1;
    #20 j=0; k=0;
    #10 j=0; k=1;
    #20 $finish;
    
  end
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,jkff_fsm_tb);
  end
  
endmodule
```

# Output
![Screenshot 2025-05-15 231732](https://github.com/user-attachments/assets/7a490d52-ef76-40df-9e78-02f2c7e7c4bb)

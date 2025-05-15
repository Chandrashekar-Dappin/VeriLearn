# State Diagram of DFF
![Screenshot 2025-05-15 204344](https://github.com/user-attachments/assets/176ea0db-1501-4152-93ac-c7b0ee2db619)

# Design Code 
```

module dff_fsm(clk,rst,d,q);
  input clk,rst,d;
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
    case(d)
      s0 : ns = s1;
      s1 : ns = s0;
    endcase
  end
  
  always@(*) begin
    q = ps;
  end

endmodule

```

# Testbench
```
module dff_fsm_tb;
  reg clk,rst,d;
  wire q;
  
  dff_fsm dut(clk,rst,d,q);
  
  initial begin
    clk=0;
    rst=1;
    #12 rst=0;
    d=1;
    #10 d=0;
    #10 d=1;
    #10 d=0;
    #20 $finish;
    
  end
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,dff_fsm_tb);
  end
  
endmodule
```

# Output
![Screenshot 2025-05-15 203737](https://github.com/user-attachments/assets/104f2f98-bdcd-4d84-9c03-3edc74b2f708)

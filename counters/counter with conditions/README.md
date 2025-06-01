### Write a Verilog code to implement a counter that cycles through two distinct ranges based on a mode: initially counting from 5 to 12, and then, upon reaching the end of this range, switching to count from 0 to 15.

# Design code :
```
  module counter (
  input clk,
  input rst,
  input ctrl,       // Mode control signal
  output reg [3:0] count
);

  reg mode_switch;  // 0: counting 5 to 12, 1: counting 0 to 15

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count <= 5;
      mode_switch <= 0;
    end else begin
      if (!mode_switch) begin
        if (count < 12)
          count <= count + 1;
        else begin
          count <= 0;
          mode_switch <= 1; // Switch mode after reaching 12
        end
      end else begin
        if (count < 15)
          count <= count + 1;
        else
          count <= 0;
      end
    end
  end

endmodule
```

# Testbench :
```
module counter_test;
  reg clk, rst, ctrl;
  wire [3:0] count;

  counter dut(clk, rst, ctrl, count);

  initial begin
    clk = 0;
    forever #2.5 clk = ~clk;
  end

  initial begin
    rst = 1;
    ctrl = 0;
    #5 rst = 0;
    #100 $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, counter_test);
  end
endmodule

```

# Output 
![Screenshot 2025-06-01 141826](https://github.com/user-attachments/assets/662caad0-95cb-4dd5-a8f8-787fc0b5f5bf)

## 1.
```
module tb;
  
  reg a,clk;
  
  always #5 clk = ~clk;
  
  always @(clk) begin
    a <= #15 clk;
    #21;
  end
  
  initial begin
    $monitor(" time: %0t, a=%b",$time,a);
    clk=1;
    a=0;
    #200 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule
```

## Output
<img width="1671" height="122" alt="Screenshot 2025-07-12 150902" src="https://github.com/user-attachments/assets/1ca9e571-73d4-46c7-8350-c22f4f3692a8" />


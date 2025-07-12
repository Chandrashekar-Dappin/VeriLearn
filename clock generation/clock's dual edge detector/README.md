## Dual edge detector
```
module dual_edge_det;
  reg clk,rst;
  int posedge_count,negedge_count;
  
  always@(clk) begin
    if(rst) begin
      posedge_count<=0;
      negedge_count<=0;
    end
    
    else
      if(clk)
        posedge_count <= posedge_count+1;
    
      else
        negedge_count <= negedge_count+1;
  end
  
  initial begin
    clk = 0;
    rst = 1;
    #12 rst = 0;
    
  end
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #150;
    $display("posedge count = %0d	negedge count = %0d",posedge_count, negedge_count);
    $finish;
  end
  
endmodule
```

## Output
### posedge count = 14	negedge count = 13
<img width="1831" height="168" alt="image" src="https://github.com/user-attachments/assets/01a2b6d7-99c6-4107-996e-876e0deac864" />

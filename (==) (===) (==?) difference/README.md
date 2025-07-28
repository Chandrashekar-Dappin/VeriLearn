## Ex: imp
## (==?) : the operand should not contain any 'x' or 'z' as it results in 'x' only...in wildcard equality which is meant to give strictly '1' or '0' as per its behsviour
```
module tb;
  
  reg [3:0] a,b;
  reg c;
  
  initial begin
    
    a = 4'b10x1;
    b = 4'b1x1x;
    
    c = (a == b);
    $display( " c = %b",c);
    
    c = (a === b);
    $display( " c = %b",c);
    
    c = (a ==? b);              // operand a must not contain 'x' or 'z' but here contains...so we are comparing 'x' with '1' not '1' with 'x'........so output is 'x' only
    $display( " c = %b",c);
    
  end
  
endmodule
```

## Output
```
 c = x
 c = 0
 c = x
```
<img width="953" height="620" alt="image" src="https://github.com/user-attachments/assets/62875482-b9a6-4aac-9aff-d3aad054f1ad" />


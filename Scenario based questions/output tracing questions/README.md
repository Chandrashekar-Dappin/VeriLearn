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

## 2. debugging
```
module tb;
  
  int count = 0;
  
  initial begin
    
    for (int i=0; i<=10; i++) begin
      
      count = count+1;                       // this incremented value is not displayed    
      
      repeat(10) begin
        
        count = count+1;
        
        $display("count = %0d",count);       //  prints from count = 2 and goes to 11 on i=0th iteration 
        
      end
      
    end
    
    
  end
  
endmodule
```

## output
```
count = 2 
count = 3
count = 4
count = 5
count = 6
count = 7
count = 8
count = 9
count = 10
count = 11
count = 13
count = 14
count = 15
count = 16
count = 17
count = 18
count = 19
count = 20
count = 21
count = 22
count = 24
count = 25
count = 26
count = 27
count = 28
count = 29
count = 30
count = 31
count = 32
count = 33
count = 35
count = 36
count = 37
count = 38
count = 39
count = 40
count = 41
count = 42
count = 43
count = 44
count = 46
count = 47
count = 48
count = 49
count = 50
count = 51
count = 52
count = 53
count = 54
count = 55
count = 57
count = 58
count = 59
count = 60
count = 61
count = 62
count = 63
count = 64
count = 65
count = 66
count = 68
count = 69
count = 70
count = 71
count = 72
count = 73
count = 74
count = 75
count = 76
count = 77
count = 79
count = 80
count = 81
count = 82
count = 83
count = 84
count = 85
count = 86
count = 87
count = 88
count = 90
count = 91
count = 92
count = 93
count = 94
count = 95
count = 96
count = 97
count = 98
count = 99
count = 101
count = 102
count = 103
count = 104
count = 105
count = 106
count = 107
count = 108
count = 109
count = 110
count = 112
count = 113
count = 114
count = 115
count = 116
count = 117
count = 118
count = 119
count = 120
count = 121
```


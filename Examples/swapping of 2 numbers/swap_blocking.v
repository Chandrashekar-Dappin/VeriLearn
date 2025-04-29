// Using '+' and '-'
module swap;
  reg [3:0] a,b;
  
  
  initial begin
    a=4;
    b=6;
    
    a=a+b;   //a=10
    b=a-b;   //b=4
    a=a-b;   //a=6
    
    $monitor("a=%d,b=%d",a,b);
    
  end
endmodule


// using XOR operator

module swap;
  reg [2:0] a,b;
  
  initial begin
    a=5;
    b=7;
    
    a=a^b;     // It does bitwise XOR operation
    b=a^b;
    a=a^b;
    
    $monitor("a=%d, b=%d",a,b);
    
  end
endmodule

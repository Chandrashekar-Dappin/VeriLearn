
## Ex : 4 bit Ripple Carry Adder using generate for
```
module full_adder (a,b,cin,s,cout);
  
  input a,b,cin;
  output s,cout;
  
  assign {cout,s} = a+b+cin;
  
endmodule


module nbit_adder #(parameter N = 4) (a,b,cin,s,cout);
  
  input [N-1 : 0] a,b;
  input cin;
  output [N-1 : 0] s;
  output cout;
  
  wire [N : 0] c;
  
  assign c[0] = cin;
  assign cout = c[4];
  
  genvar i;
  
  generate for(i=0; i<N ; i=i+1)
    begin
      full_adder FA(a[i],b[i],c[i],s[i],c[i+1]);
    end
  endgenerate
  
endmodule



module tb;
  
  defparam dut.N = 10;
  
  reg [dut.N-1:0] a,b;
  reg cin;
  wire [dut.N-1:0] s;
  wire cout;
  
  nbit_adder dut(a,b,cin,s,cout);
  
  initial begin
    
    repeat(10) begin
      {a,b,cin} = $random();
      #1;
    end
    
  end
  
  initial begin
    $monitor (" a = %b | b = %b | c = %b | sum = %b, carry = %b",a,b,cin,s,cout);
  end
  
endmodule


//Output
 a = 1010100110 | b = 1010010010 | c = 0 | sum = 0100111000, carry = 0
 a = 0100101011 | b = 1101000000 | c = 1 | sum = 0001101100, carry = 0
 a = 0010011010 | b = 1100000100 | c = 1 | sum = 1110011111, carry = 0
 a = 1000001010 | b = 1100110001 | c = 1 | sum = 0100111100, carry = 0
 a = 1100101111 | b = 0110000110 | c = 1 | sum = 0010110110, carry = 1
 a = 1111110011 | b = 0011000110 | c = 1 | sum = 0010111010, carry = 0
 a = 0001010000 | b = 1000110010 | c = 1 | sum = 1010000011, carry = 0
 a = 1011101010 | b = 0100001001 | c = 0 | sum = 1111110011, carry = 1
 a = 1001111100 | b = 0110000000 | c = 1 | sum = 1111111101, carry = 0
 a = 1011111001 | b = 1010000110 | c = 1 | sum = 0110000000, carry = 1
```

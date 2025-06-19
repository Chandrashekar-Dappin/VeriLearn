
module FA_struct(input a,b,cin, output s,cout);
  
  wire w1,w2,w3;
  
  xor x1(w1,a,b);
  and a1(w2,a,b);
  xor x2(s,w1,cin);
  and a2(w3,w1,cin);
  or o1(cout,w2,w3);
  
endmodule



module ripple_adder_4bit(a,b,cin,s,cout);
  input [3:0] a,b;
  input cin;
  output [3:0] s;
  output cout;
  
  wire c1,c2,c3;
  
  FA_struct dut1 (a[0],b[0],cin,s[0],c1);
  FA_struct dut2 (a[1],b[1],c1,s[1],c2);
  FA_struct dut3 (a[2],b[2],c2,s[2],c3);
  FA_struct dut4 (a[3],b[3],c3,s[3],cout);
  
endmodule


module tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0]s;
  wire cout;
  
  ripple_adder_4bit dut(a,b,cin,s,cout);
  
  initial begin
    $monitor("%b %b %b %b %b",a,b,cin,s,cout);
    a=4'b0011; b=4'b0011 ; cin=1'b1;
    #1 a=4'b1111; b=4'b0111 ; cin=1'b1;
  end
  
endmodule

module FA_struct(input a,b,cin, output s,cout);
  
  wire w1,w2,w3;
  
  xor x1(w1,a,b);
  and a1(w2,a,b);
  xor x2(s,w1,cin);
  and a2(w3,w1,cin);
  or o1(cout,w2,w3);
  
endmodule



module tb;
  
  reg a,b,cin;
  wire s,cout;
  
  FA_struct dut(a,b,cin,s,cout);
  
  initial begin
    $monitor("%0d %0d %0d %0d %0d",a,b,cin,s,cout);
    a=0; b=0; cin=1;
    #1 a=1; b=1; cin=0;
    #1 a=1; b=1; cin=1;

  end
  
endmodule

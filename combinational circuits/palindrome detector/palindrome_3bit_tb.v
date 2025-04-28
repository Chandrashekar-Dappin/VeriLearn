module palindrome_3bit_tb;
  reg a,b,c;
  wire y;
  
  palindrome_3bit dut(a,b,c,y);
  
  initial begin
    
    $monitor("time=%0t , a=%b, b=%b, c=%b, y=%b",$time,a,b,c,y);
    
    a=0; b=0; c=0; #5;
    a=0; b=0; c=1; #5;
    a=0; b=1; c=0; #5;
    a=0; b=1; c=1; #5;
    a=1; b=0; c=0; #5;
    a=1; b=0; c=1; #5;
    a=1; b=1; c=0; #5;
    a=1; b=1; c=1; #5;
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,a,b,c,y);
  end
  
endmodule

module half_adder_tb;
  reg a,b;
  wire s,c;
  
  half_adder dut(a,b,s,c);  //module instantiation
  
  initial begin
    a=0; b=0;
    #5 b=1;           // stimulus genaration
    #5 a=1; b=0;
    #5 b=1;
    

  end
  
  initial begin
    $monitor("sim time = %0t, a = %0d, b = %0d, s = %0d ,c = %0d ",$time,a,b,s,c);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,a,b,s,c);
  end
  
endmodule

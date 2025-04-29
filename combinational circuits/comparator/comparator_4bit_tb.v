module test;
  
  reg [3:0] a,b;
  wire gt,st,eq;
  
  comparator_4bit dut(a,b,gt,st,eq);
  
  initial begin
    a=4'b0010; b=4'b0001;
    #5 a=4'b0010; b=4'b0100;
    #5 a=4'b0010; b=4'b0010;
  end
  
  initial begin
    $monitor("a=%b, b=%b, (a>b)=%b, (a<b)=%b, (a=b)=%b",a,b,gt,st,eq);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
  
  
endmodule

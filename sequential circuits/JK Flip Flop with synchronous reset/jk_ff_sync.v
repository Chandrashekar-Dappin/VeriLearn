module jk_ff_sync(j,k,clk,rst,q);
  input j,k,clk,rst;
  output q;
  reg temp;
  
  assign q = temp;
  
  always@(posedge clk) begin
    if(rst)
      temp<=0;
    
    else
      if(j==0 & k==0)
        temp<=temp;
      else if(j==0 & k==1)
        temp<=0;
      else if(j==1 & k==0)
        temp<=1;
      else 
        temp<=~temp;
      
  end

  
endmodule


//Testbench

module tb;
  reg j,k,clk,rst;
  wire q;
  
  jk_ff_async dut(j,k,clk,rst,q);
  
  initial begin
    clk=0;
    rst=1;
    #12 rst=0;
    j=0; k=0;
    #5 j=0; k=1;
    #7 j=1; k=0;
    rst=1;
    #5 rst=0;
    #4 j=1; k=1;
    
    #10 $finish;
  end
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end
  
endmodule

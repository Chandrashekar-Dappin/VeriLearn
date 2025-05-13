module tff_sync(t,clk,rst,q);
  input clk,rst,t;
  output reg q;
  reg temp;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        temp<=0;
      
      else
          if(t)
            temp<=~temp;
          else
            temp<=temp;
      
      q<=temp;       
     
    end
  
endmodule
      

//Testbench

module test;
  reg clk,rst,t;
  wire q;
  
  tff_sync dut(t,clk,rst,q);
  
  initial begin
    clk=0;
    rst=1;
    #10 rst=0;
    t=0;
    #5 t=1;
    #5 t=0;
    rst=1;
    
    #5 t=1;
    #5 t=0;
    #50 $finish;
  end
  
  initial begin
    $monitor("sim time=%0t, t=%0b, q=%0b",$time,t,q);
  end
  
  always #5 clk=~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule

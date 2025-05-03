module tb; 
  reg clk,rst; 
  wire [6:0] count; 
   
  counter_mod_100  dut(clk,rst,count); 
   
  initial begin 
     
    clk=0; 
    rst=1; 
    #10 rst=0; 
     
    #1100 $finish; 
     
  end 
   
  always #5 clk=~clk; 
   
  initial begin 
    $monitor("sim time = %0t | count = %d",$time,count); 
  end 
   
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(1,tb);      
  end 
               
endmodule 

// 1. clock generation by always block

module clk1; 
  reg clk; 
  initial begin 
   clk=0; 
   #100 $finish; 
  end 
  always begin 
   clk=~clk; 
  initial begin 
   $dumpfile("dump.vcd"); 
   $dumpvars(0,clk); 
  end 
endmodule 

  // 2. clock generation by always block

module clk1; 
  reg clk; 
  real time_period = 10;  //10ns 
  real ton; 
   
  initial begin 
    clk=0; 
    ton = time_period/2; 
 
    #100 $finish; 
     
  end 
   
  always begin 
    #ton clk=1; 
    #ton clk=0; 
  end 
   
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(0,clk); 
  end 
   
endmodule 


  // 3. clock generation by forever block
module clk1; 
  reg clk; 
  initial begin  
   clk=0; 
   100 $finish; 
  end 
  initial begin 
   forever #5 clk=~clk; 
  end 
  initial begin 
   $dumpfile("dump.vcd"); 
   $dumpvars(0,clk); 
  end 
endmodule 


  // 4. clock generation by repeat block

module clk1; 
  reg clk; 
  initial begin  
   clk=0; 
  repeat(20) #5 clk=~clk; 
   #100 $finish; 
  end 
  initial begin 
   $dumpfile("dump.vcd"); 
   $dumpvars(0,clk); 
  end 
endmodule


  // 5. clock generation manually

module clk1; 
  reg clk; 
  initial begin  
   clk=0; 
   #5 clk=1; 
   #5 clk=0; 
   #5 clk=1; 
   #5 clk=0; 
   #5 clk=1; 
   #5 clk=0; 
   #100 $finish; 
  end 
  
  initial begin 
   $dumpfile("dump.vcd"); 
   $dumpvars(0,clk); 
  end 
endmodule 



    // 6. using xor / xnor

module tb;
  reg clk;
  
  initial begin
    clk = 0;
    #100 $finish();
  end
  
  always #5 clk = clk ~^ 0;
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule


module tb;
  reg clk;
  
  initial begin
    clk = 0;
    #100 $finish();
  end
  
  always #5 clk = clk ^ 1;
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule    

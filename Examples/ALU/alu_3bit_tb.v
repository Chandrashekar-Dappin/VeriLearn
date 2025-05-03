module tb; 
  reg [2:0] a,b,opcode; 
  wire [4:0] y; 
   
  ALU dut(a,b,opcode,y); 
   
  initial begin 
    a=3'd5; 
    b=3'd2; 
    $monitor("a = %d, b = %d, opcode = %b, y = %d",a,b,opcode,y); 
  end 
  initial begin 
    for (opcode = 0; opcode<8; opcode++) begin 
     #10; 
    end 
  end 
endmodule 

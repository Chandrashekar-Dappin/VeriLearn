module priority_enc_4_2_tb;
  reg [3:0]D;
  wire [1:0]I;
  
  
  priority_enc_4_2 dut(D,I);
  
  initial begin
    $display("D    => I");
    $display("----------------");
    // Loop through all input combinations
    for (integer i = 0; i < 16; i = i + 1) begin
      D = i; 
      #5; // Wait for 5 time units
      $display("%b => %b", D, I);
    end
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,D,I);
  end
  
endmodule

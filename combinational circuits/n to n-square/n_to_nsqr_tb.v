module n_to_nsqr_tb;
  reg [1:0] n;
  wire [3:0] N;
  
  n_to_nsqr dut(n,N);
  
  initial begin
    
    $monitor("time=%0t, n=%b, N=%b",$time,n,N);
    
    n=2'b00; #5;
    n=2'b01; #5;
    n=2'b10; #5;
    n=2'b11;
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,n,N);
  end
  
endmodule

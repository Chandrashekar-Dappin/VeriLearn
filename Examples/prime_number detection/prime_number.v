module prime_checker (
    input clk,
    input rst,
    input start,
    input [7:0] num,
    output reg is_prime,
    output reg done
);

    reg [7:0] i;
    reg [7:0] n;
    reg checking;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            is_prime <= 0;
            done <= 0;
            checking <= 0;
            i <= 2;
        end else if (start && !checking) begin
            n <= num;
            i <= 2;
            is_prime <= 1; // Assume prime initially
            done <= 0;
            checking <= 1;
        end else if (checking) begin
            if (n <= 1) begin
                is_prime <= 0;
                done <= 1;
                checking <= 0;
            end else if (i <= n/2) begin
                if (n % i == 0) begin
                    is_prime <= 0; // Not a prime
                    done <= 1;
                    checking <= 0;
                end else begin
                    i <= i + 1;
                end
            end else begin
                done <= 1;
                checking <= 0;
            end
        end
    end
endmodule

          
// Test Bench

module prime_checking_tb;
  reg clk,rst,start;
  reg [7:0] num;
  wire done;
  wire is_prime;
  
    prime_checker uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .num(num),
        .is_prime(is_prime),
        .done(done)
    );
  
  
  always #5 clk=~clk;
  
  initial begin
    clk=0;
    rst=1;
    start=0;
    num=0;
    
    #10 rst=0;
    
    num = 7;
    start =1;
    #10 start =0;
    
    wait(done);
    $display(" number = %d, Prime = %b ",num,is_prime);
    
    num = 15;
    start = 1;
    #20 start = 0;
    
    wait(done);
    $display(" number = %d, Prime = %b ",num,is_prime);
    
    
    $stop;
    
  end
  
endmodule
  

module counter_up_down_3bit_fsm (clk, rst,ctrl, count);
  input clk, rst,ctrl;
  output reg [2:0] count;
  
  reg [2:0] ps,ns;
  
  parameter s0 = 3'b000;
  parameter s1 = 3'b001; 
  parameter s2 = 3'b010;
  parameter s3 = 3'b011;
  parameter s4 = 3'b100;
  parameter s5 = 3'b101;
  parameter s6 = 3'b110;
  parameter s7 = 3'b111;
  
  always @(posedge clk) begin
    if(rst) 
      ps <= s0;
    
    else
      ps <= ns;
  end
  
  always @(ps) begin
    case(ps)
      s0 : if(ctrl)begin
             count = 3'b000;
             ns = s1;
           end
      
           else begin
             count = 3'b111;
             ns = s7;
           end
      
      
      s1 : if(ctrl)begin
            count = 3'b001;
            ns = s2;
           end
      
           else begin
             count = 3'b000;
             ns = s0;
           end
      
      s2 : if(ctrl)begin
            count = 3'b010;
           ns = s3;
           end
      
           else begin
             count = 3'b001;
             ns = s1;
           end
       
      s3 : if(ctrl)begin
            count = 3'b011;
           ns = s4;
           end
      
           else begin
             count = 3'b010;
             ns = s2;
           end
      
      s4 : if(ctrl)begin
            count = 3'b100;
            ns = s5;
           end
      
           else begin
             count = 3'b011;
             ns = s3;
           end
      
      s5 : if(ctrl)begin
            count = 3'b101;
           ns = s6;
           end
      
           else begin
             count = 3'b100;
             ns = s4;
           end
      
      s6 : if(ctrl)begin
            count = 3'b110;
           ns = s7;
           end
      
           else begin
             count = 3'b101;
             ns = s5;
           end
      
      s7 : if(ctrl)begin
            count = 3'b111;
            ns = s0;
           end
      
           else begin
             count = 3'b110;
             ns = s6;
           end
      
      default : begin
                count = 3'b000;
                ns = s0;
                end
    endcase
    
  end
endmodule



// TestBench

module counter_up_down_3bit_fsm_tb ;
  reg clk, rst,ctrl;
  wire [2:0] count;

  counter_up_down_3bit_fsm dut(clk, rst,ctrl, count);

  initial begin
    clk = 0;
    rst = 1;
    #12 rst = 0;
    ctrl = 1;
    #40 ctrl = 0;
    #60 ctrl = 1;
    #200 $finish;
  end

  always #5 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,counter_up_down_3bit_fsm_tb );
  end
  
endmodule

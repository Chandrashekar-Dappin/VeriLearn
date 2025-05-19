# Dual Port Ram

## The recent technology has developed dual port memories. Now it is possible to access the same address locations through two ports. Dual port memories have simplified many problems in designing digital systems. Both ROM and RAM can be of dual port. The block diagram of a true dual port RAM is shown below.

![Screenshot 2025-05-19 163908](https://github.com/user-attachments/assets/2715a80f-b0f9-4537-a998-87386565e654)

## The dual port memories have separate control line for both the ports. The various modes of a typical true dual port RAM are shown below. In the mode 1, writing of data is possible through both the ports but not on the same location. In mode 4, data can be read through both the ports even from the same address location. In mode 2 and 3, one port is busy in writing while another port is reading data.

![Screenshot 2025-05-19 164031](https://github.com/user-attachments/assets/2044492b-fd56-4fb1-8ffd-8ad5ccca8d5d)



# Design Code
```

module dual_port_ram(clk,we_a,we_b,en_a,en_b,data_in_a,data_in_b,addres_a,addres_b,data_out_a,data_out_b);
  input clk,we_a,we_b,en_a,en_b;
  input [7:0] data_in_a,data_in_b;
  input [2:0] addres_a,addres_b;
  output reg [7:0] data_out_a,data_out_b;
  
  reg [7:0] mem [0:7];
  
  initial begin
    data_out_a = 8'b00000000;
    data_out_b = 8'b00000000;
  end
  
  always@(posedge clk) begin
    if(en_a)
      if(we_a)
        mem[addres_a] <= data_in_a;
    
      else
        data_out_a <= mem[addres_a];
    
    else
      data_out_a <= data_out_a;
    
  end
    
    
  always@(posedge clk) begin
    if(en_b)
      if(we_b)
        mem[addres_b] <= data_in_b;
    
      else
        data_out_b <= mem[addres_b];
    
    else
      data_out_b <= data_out_b;
    
  end
  
endmodule
    
```

# Testbench
```
`timescale 1ns/1ps

module tb_dual_port_ram;
  
  reg clk,we_a,we_b,en_a,en_b;
  reg [7:0] data_in_a,data_in_b;
  reg [2:0] addres_a,addres_b;
  wire [7:0] data_out_a,data_out_b;


  // Instantiate the DUT (Device Under Test)
dual_port_ram dut(clk,we_a,we_b,en_a,en_b,data_in_a,data_in_b,addres_a,addres_b,data_out_a,data_out_b);

  // Clock generation
  always #5 clk = ~clk;  // 10ns clock period

  initial begin
    // Initialize inputs
    clk = 0;
    we_a = 0;
    we_b = 0;
    en_a = 0;
    en_b = 0;
    data_in_a = 8'd0;
    data_in_b = 8'd0;

    addres_a = 3'd0;
    addres_b = 3'd0;


    // Wait for global reset
    #10;

    // Write data to address 3
    en_a = 1; we_a = 1; data_in_a = 8'hA5; addres_a = 3'd3;
    en_b = 1; we_b = 1; data_in_b = 8'h59; addres_b = 3'd3;

    #10;

    // Write data to addresses 5 and 6
    data_in_a = 8'h5A; addres_a = 3'd5;
    data_in_b = 8'h41; addres_b = 3'd6;

    #10;

    // Read from address 3
    we_a = 0; addres_a = 3'd3;
    we_b = 0; addres_b = 3'd3;

    #10;

    // Read from address 5 and 6
    addres_a = 3'd5;
    addres_b = 3'd6;

    #10;

    // Disable enable signal and try reading (no change expected)
    en_a = 0; addres_a = 3'd3;
    en_b = 1; addres_b = 3'd3;

    #10;

    #100 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb_dual_port_ram);
  end

endmodule

```

# Output

![Screenshot 2025-05-19 163459](https://github.com/user-attachments/assets/40df052a-f6d3-420a-93fc-b1bc4eb6c1c4)

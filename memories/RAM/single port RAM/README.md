# Single Port Ram
![Screenshot 2025-05-19 155236](https://github.com/user-attachments/assets/66dff3b3-e079-4afe-b594-931412d98d2e)

# Design Code
```
module single_port_ram(clk,we,en,data_in,addres,data_out);
  input clk,we,en;
  input [7:0] data_in;
  input [2:0] addres;
  output reg [7:0] data_out;
  
  reg [7:0] mem [0:7];

  initial begin
    data_out = 8'b00000000;
  end

  always@(posedge clk) begin
    if(en)
      if(we)
        mem[addres] <= data_in;
    
      else
        data_out <= mem[addres];
    
    else
      data_out <= data_out;
    
  end
  
endmodule
```

# TestBench
```

`timescale 1ns/1ps

module tb_single_port_ram;

  // Testbench signals
  reg clk;
  reg we, en;
  reg [7:0] data_in;
  reg [2:0] addres;
  wire [7:0] data_out;

  // Instantiate the DUT (Device Under Test)
  single_port_ram uut (
    .clk(clk),
    .we(we),
    .en(en),
    .data_in(data_in),
    .addres(addres),
    .data_out(data_out)
  );

  // Clock generation
  always #5 clk = ~clk;  // 10ns clock period

  initial begin
    // Initialize inputs
    clk = 0;
    we = 0;
    en = 0;
    data_in = 8'd0;
    addres = 3'd0;

    // Wait for global reset
    #10;

    // Write data to address 3
    en = 1; we = 1; data_in = 8'hA5; addres = 3'd3;
    #10;

    // Write data to address 5
    data_in = 8'h5A; addres = 3'd5;
    #10;

    // Read from address 3
    we = 0; addres = 3'd3;
    #10;

    // Read from address 5
    addres = 3'd5;
    #10;

    // Disable enable signal and try reading (no change expected)
    en = 0; addres = 3'd3;
    #10;

    #100 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb_single_port_ram);
  end

endmodule
```

![Screenshot_19-5-2025_155113_edaplayground com](https://github.com/user-attachments/assets/c71ebec0-3bbb-4883-9293-0832dc33a171)



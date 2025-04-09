module mux_2_1_tb;
  reg I0,I1,s;
  wire y;
  
  mux_2_1 dut(I0,I1,s,y);  //module instantiation
  
  initial begin            //procedural block
    I0 = 1'b0; I1 = 1'b0; s=1'b0;
    #5 s=1'b1;
    #5 I1 = 1'b1; s=1'b0;      //generation of stimulus
    #5 s=1'b1;
    #5 I0 = 1'b1; I1 = 1'b0; s=1'b0;
    #5 s=1'b1;
    #5 I1 = 1'b1; s=1'b0;
    #5 s=1'b1;
  end
  
  initial begin
    $monitor("sim time = %0t, I0 = %0b, I1 = %0b, s = %0b ,y = %0b ",$time,I0,I1,s,y);
  end
  
  initial begin           // for waveform simulation
    $dumpfile("dump.vcd");
    $dumpvars(0,I0,I1,s,y);
  end
  
endmodule
  
  

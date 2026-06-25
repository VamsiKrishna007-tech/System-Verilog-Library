//Assume `timescale 1ps/1ps. Generate a 25 MHz square wave waveform for the Signal clk.

`timescale 1ps/1ps
module tb();
reg clk;

initial begin 
clk = 1'b0;
end

always #20000 clk = ~clk; # 25MHz = 40000ps 

endmodule

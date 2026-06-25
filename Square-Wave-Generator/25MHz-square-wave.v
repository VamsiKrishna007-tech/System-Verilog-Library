
`timescale 1ns / 1ps

module tb();
reg clk = 0; 
reg clk40 = 0;

always #5 clk = ~clk;   //Reference Clock 100MHz
  
task clkgen(input real ton, input real toff);  
  while(1) 
  begin
  clk40 = 1;
  #ton;
  clk40 = 0;
  #toff;
  end
endtask

task calc (input real freq_hz, input real duty_cycle, output real ton, output real toff);
ton = (1.0 / freq_hz) * duty_cycle * 1000_000;
toff =  (1000_000 / freq_hz) - ton;
endtask

initial begin
calc(25, 0.4, ton, toff);
clkgen(ton, toff);
end

  initial begin
    #200;
    $finish();
  end
endmodule

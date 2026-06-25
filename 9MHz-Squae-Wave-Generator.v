//Write a code to generate a 9MHz square waveform for the signal sclk. Assume timescale with 1nsec time-unit and 3 digit precision.Share your SV Code.

`timescale 1ns/1ns
module tb();
reg sclk;
initial
 begin
 sclk = 1'b0;
end
*/
9MHz = 9,00,000
1/900000 = 111.111 ns
Half = 55.556 ns
*/

always #55.556   sclk = ~sclk;

endmodule

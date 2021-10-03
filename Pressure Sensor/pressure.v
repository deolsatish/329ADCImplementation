module pressure (
input wire clk,
input wire slider,
input wire slider2,
input wire slider3,
output wire [5:3] LED// 3 LEDS

);

// create a binary counter
reg [31:0] cnt; //32 bit counter

initial begin

cnt <= 32'h00000000; // start count at zero

end

always @(posedge slider) begin

cnt <= cnt+1; // count up

end



//assign LEDs to bits 28 through 26 of the counter
assign LED[3] = !slider;
assign LED[4] = !slider2;
assign LED[5] = !slider3;



endmodule
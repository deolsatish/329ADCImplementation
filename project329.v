module project329 (CLOCK_50, KEY, SW, LED, ADC_SCLK,
ADC_CONVST, ADC_SDO, ADC_SDI,pressure_buttons);
input CLOCK_50;
input [0:0] KEY;
input [2:0] SW;
input [1:0] pressure_buttons;
output [7:0] LED;
input ADC_SDO;
output ADC_SCLK, ADC_CONVST, ADC_SDI;
wire [11:0] values [7:0];
assign LED[5:0] = values [SW] [9:4];
assign LED[6] = !pressure_buttons [0];
assign LED[7] = !pressure_buttons [1];

adc_control ADC (
.CLOCK (CLOCK_50),
.RESET (!KEY[0]),
.ADC_SCLK (ADC_SCLK),
.ADC_CS_N (ADC_CONVST),
.ADC_DOUT (ADC_SDO),
.ADC_DIN (ADC_SDI),
.CH0 (values[0]),
.CH1 (values[1]),
.CH2 (values[2]),
.CH3 (values[3]),
.CH4 (values[4]),
.CH5 (values[5]),
.CH6 (values[6]),
.CH7 (values[7])
);
endmodule
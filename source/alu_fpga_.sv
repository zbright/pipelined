module alu_fpga (
	input logic [3:0] KEY,
	input logic [17:0] SW,
	output logic [17:0] LEDR,
	output logic [6:0]HEX0,
	output logic [6:0]HEX1,
	output logic [6:0]HEX2,
	output logic [6:0]HEX3,
	output logic [6:0]HEX4,
	output logic [6:0]HEX5,
	output logic [6:0]HEX6,
	output logic [6:0]HEX7
);

logic [31:0] TEMPA;
logic [31:0] TEMPB;
logic [31:0] OUTPUT;
logic [14:0] SWITCHVAL;
logic ABSELECT;
logic TOGGLE;

assign SWITCHVAL = SW[14:0];
assign ABSELECT = SW[17];
assign TOGGLE = SW[15];
assign OPCODE = KEY[3:0];
assign LEDR[0] = NEGATIVE;
assign LEDR[1] = OVERFLOW;
assign LEDR[2] = ZERO;
//assigning values
assign TEMPA [14:0] = TOGGLE ? SWITCHVAL : TEMPA;
assign TEMPB [14:0] = TOGGLE ? TEMPB : SWITCHVAL;


ALU ALU(TEMPA, TEMPB, OPCODE, OUTPUT, NEGATIVE, OVERFLOW, ZERO);


/*assign rfif.wsel = SW[4:0];
assign rfif.rsel1 = SW[9:5];
assign rfif.rsel2 = SW[14:10];
assign rfif.wdat = {29'b0,SW[17:15]};

assign rfif.WEN = ~KEY[3];

assign LEDR[8:5] = rfif.rdat1[3:0];
assign LEDR[13:10] = rfif.rdat2[3:0];
*/

endmodule

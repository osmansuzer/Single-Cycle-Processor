// Osman Suzer
//
// 131044051
//

module mux_2_for_4_bits(result, d0, d1, select);

	output [3:0] result;
	input [3:0] d0;
	input [3:0] d1;
	
	input select;

	wire [3:0] result;
	wire [3:0] d0;
	wire [3:0] d1;
	
	wire select;
	
	
	mux_2 mux1(result[0], d0[0], d1[0], select);
	mux_2 mux2(result[1], d0[1], d1[1], select);
	mux_2 mux3(result[2], d0[2], d1[2], select);
	mux_2 mux4(result[3], d0[3], d1[3], select);
	
endmodule
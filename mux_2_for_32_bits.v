// Osman Suzer
//
// 131044051
//

module mux_2_for_32_bits(result, d0, d1, select);

	output [31:0] result;
	input [31:0] d0;
	input [31:0] d1;
	
	input select;

	wire [31:0] result;
	wire [31:0] d0;
	wire [31:0] d1;
	
	wire select;
	
	
	mux_2 mux1(result[0], d0[0], d1[0], select);
	mux_2 mux2(result[1], d0[1], d1[1], select);
	mux_2 mux3(result[2], d0[2], d1[2], select);
	mux_2 mux4(result[3], d0[3], d1[3], select);
	mux_2 mux5(result[4], d0[4], d1[4], select);
	mux_2 mux6(result[5], d0[5], d1[5], select);
	mux_2 mux7(result[6], d0[6], d1[6], select);
	mux_2 mux8(result[7], d0[7], d1[7], select);
	mux_2 mux9(result[8], d0[8], d1[8], select);
	mux_2 mux10(result[9], d0[9], d1[9], select);
	mux_2 mux11(result[10], d0[10], d1[10], select);
	mux_2 mux12(result[11], d0[11], d1[11], select);
	mux_2 mux13(result[12], d0[12], d1[12], select);
	mux_2 mux14(result[13], d0[13], d1[13], select);
	mux_2 mux15(result[14], d0[14], d1[14], select);
	mux_2 mux16(result[15], d0[15], d1[15], select);
	mux_2 mux17(result[16], d0[16], d1[16], select);
	mux_2 mux18(result[17], d0[17], d1[17], select);
	mux_2 mux19(result[18], d0[18], d1[18], select);
	mux_2 mux20(result[19], d0[19], d1[19], select);
	mux_2 mux21(result[20], d0[20], d1[20], select);
	mux_2 mux22(result[21], d0[21], d1[21], select);
	mux_2 mux23(result[22], d0[22], d1[22], select);
	mux_2 mux24(result[23], d0[23], d1[23], select);
	mux_2 mux25(result[24], d0[24], d1[24], select);
	mux_2 mux26(result[25], d0[25], d1[25], select);
	mux_2 mux27(result[26], d0[26], d1[26], select);
	mux_2 mux28(result[27], d0[27], d1[27], select);
	mux_2 mux29(result[28], d0[28], d1[28], select);
	mux_2 mux30(result[29], d0[29], d1[29], select);
	mux_2 mux31(result[30], d0[30], d1[30], select);
	mux_2 mux32(result[31], d0[31], d1[31], select);
	
endmodule
// Osman Suzer
//
// 131044051
//

module Sign_Extender(extended, extend, Unsigned);

	input [15:0]extend;
	input Unsigned;
	output [31:0]extended;
	
	wire [15:0]extend;

	wire [31:0]extended;
	
	wire [31:0]extended_0;
	
	// add 0 first 16 bits (unsigned) 
	wire [31:0]extended_1 = {{16'b0},{extend}};
	wire Unsigned;
	
	// add extend[15] first 16 bits (signed)
	assign extended_0[0] = extend[0];
	assign extended_0[1] = extend[1];
	assign extended_0[2] = extend[2];
	assign extended_0[3] = extend[3];
	assign extended_0[4] = extend[4];
	assign extended_0[5] = extend[5];
	assign extended_0[6] = extend[6];
	assign extended_0[7] = extend[7];
	assign extended_0[8] = extend[8];
	assign extended_0[9] = extend[9];
	assign extended_0[10] = extend[10];
	assign extended_0[11] = extend[11];
	assign extended_0[12] = extend[12];
	assign extended_0[13] = extend[13];
	assign extended_0[14] = extend[14];
	assign extended_0[15] = extend[15];
	assign extended_0[16] = extend[15];
	assign extended_0[17] = extend[15];
	assign extended_0[18] = extend[15];
	assign extended_0[19] = extend[15];
	assign extended_0[20] = extend[15];
	assign extended_0[21] = extend[15];
	assign extended_0[22] = extend[15];
	assign extended_0[23] = extend[15];
	assign extended_0[24] = extend[15];
	assign extended_0[25] = extend[15];
	assign extended_0[26] = extend[15];
	assign extended_0[27] = extend[15];
	assign extended_0[28] = extend[15];
	assign extended_0[29] = extend[15];
	assign extended_0[30] = extend[15];
	assign extended_0[31] = extend[15];
	
	// select signed or unsigned
	mux_2_for_32_bits _mux(extended, extended_0, extended_1, Unsigned);
	
endmodule
// Osman Suzer
//
// 131044051
//

module _32_Bits_ALU(result, c32, Z, V, a, b, aluOp, shamt);

	input [31:0]a;
	input [31:0]b;
	input [2:0]aluOp;
	input [4:0]shamt;
	
	output [31:0]result;
	output c32;
	output Z, V;
	
	wire [31:0]a, b,c, r, result;
	wire lessi;
	assign lessi = 0;
	assign c[0] = aluOp[2];
	
	
	// if operation is siht (sll srl)
	wire [31:0] _sll, _srl;
	wire [31:0] shift;
	
	assign _sll = a << shamt;
	assign _srl = a >> shamt;
	
	wire [4:0]shamt;
	wire sll, srl, SignalShift;
	and(sll, ~aluOp[2], aluOp[1], aluOp[0]);
	and(srl, aluOp[2], ~aluOp[1], ~aluOp[0]);
	or(SignalShift, sll, srl);
	
	// select sll or srl
	mux_2_for_32_bits _mux1(shift, _srl, _sll, sll);
	
	_1_Bit_ALU alu1(r[0], c[1], a[0], b[0], c[0], aluOp, set);
	_1_Bit_ALU alu2(r[1], c[2], a[1], b[1], c[1], aluOp, lessi);
	_1_Bit_ALU alu3(r[2], c[3], a[2], b[2], c[2], aluOp, lessi);
	_1_Bit_ALU alu4(r[3], c[4], a[3], b[3], c[3], aluOp, lessi);
	_1_Bit_ALU alu5(r[4], c[5], a[4], b[4], c[4], aluOp, lessi);
	_1_Bit_ALU alu6(r[5], c[6], a[5], b[5], c[5], aluOp, lessi);
	_1_Bit_ALU alu7(r[6], c[7], a[6], b[6], c[6], aluOp, lessi);
	_1_Bit_ALU alu8(r[7], c[8], a[7], b[7], c[7], aluOp, lessi);
	_1_Bit_ALU alu9(r[8], c[9], a[8], b[8], c[8], aluOp, lessi);
	_1_Bit_ALU alu10(r[9], c[10], a[9], b[9], c[9], aluOp, lessi);
	_1_Bit_ALU alu11(r[10], c[11], a[10], b[10], c[10], aluOp, lessi);
	_1_Bit_ALU alu12(r[11], c[12], a[11], b[11], c[11], aluOp, lessi);
	_1_Bit_ALU alu13(r[12], c[13], a[12], b[12], c[12], aluOp, lessi);
	_1_Bit_ALU alu14(r[13], c[14], a[13], b[13], c[13], aluOp, lessi);
	_1_Bit_ALU alu15(r[14], c[15], a[14], b[14], c[14], aluOp, lessi);
	_1_Bit_ALU alu16(r[15], c[16], a[15], b[15], c[15], aluOp, lessi);
	_1_Bit_ALU alu17(r[16], c[17], a[16], b[16], c[16], aluOp, lessi);
	_1_Bit_ALU alu18(r[17], c[18], a[17], b[17], c[17], aluOp, lessi);
	_1_Bit_ALU alu19(r[18], c[19], a[18], b[18], c[18], aluOp, lessi);
	_1_Bit_ALU alu20(r[19], c[20], a[19], b[19], c[19], aluOp, lessi);
	_1_Bit_ALU alu21(r[20], c[21], a[20], b[20], c[20], aluOp, lessi);
	_1_Bit_ALU alu22(r[21], c[22], a[21], b[21], c[21], aluOp, lessi);
	_1_Bit_ALU alu23(r[22], c[23], a[22], b[22], c[22], aluOp, lessi);
	_1_Bit_ALU alu24(r[23], c[24], a[23], b[23], c[23], aluOp, lessi);
	_1_Bit_ALU alu25(r[24], c[25], a[24], b[24], c[24], aluOp, lessi);
	_1_Bit_ALU alu26(r[25], c[26], a[25], b[25], c[25], aluOp, lessi);
	_1_Bit_ALU alu27(r[26], c[27], a[26], b[26], c[26], aluOp, lessi);
	_1_Bit_ALU alu28(r[27], c[28], a[27], b[27], c[27], aluOp, lessi);
	_1_Bit_ALU alu29(r[28], c[29], a[28], b[28], c[28], aluOp, lessi);
	_1_Bit_ALU alu30(r[29], c[30], a[29], b[29], c[29], aluOp, lessi);
	_1_Bit_ALU alu31(r[30], c[31], a[30], b[30], c[30], aluOp, lessi);
	MSB_1_Bit_ALU msb(r[31], c32, V, set, a[31], b[31], c[31], aluOp, lessi);
	
	wire Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8;
	wire ZX;
	
	or(Z1, r[0], r[1], r[2], r[3]);
	or(Z2, r[4], r[5], r[6], r[7]);
	or(Z3, r[8], r[9], r[10], r[11]);
	or(Z4, r[12], r[13], r[14], r[15]);
	or(Z5, r[16], r[17], r[18], r[19]);
	or(Z6, r[20], r[21], r[22], r[23]);
	or(Z7, r[24], r[25], r[26], r[27]);
	or(Z8, r[28], r[29], r[30], r[31]);
	or(ZX, Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8);
	not(Z, ZX);
	
	// select result => shift or r
	mux_2_for_32_bits _mux2(result, r, shift, SignalShift);
	
	
endmodule
// Osman Suzer
//
// 131044051
//

module _1_Bit_ALU(ri, ci_1, ai, bi, ci, aluOp, lessi);

	input ai;
	input bi;
	input ci;
	
	input [2:0] aluOp;
	input lessi;
	
	output ri;
	output ci_1;
	
	wire ai, bi, ci;
	wire [2:0] aluOp;
	
	// xor
	wire xor1;
	xor(xor1, bi, aluOp[2]);
	
	wire and1, or1, not1;
	
	// and1
	//secme 0 = and1
	and(and1, xor1, ai);
	
	
	// or1
	//secme 1 = or1
	or(or1, xor1, ai);
	not(not1, and1);
	
	
	wire and2, and3,and4, not2, or2;
	
	//and2
	and(and2, not1, or1);
	//and3
	and(and3, ci, and2);
	//not2
	not(not2, and3);
	//or2
	or(or2, ci, and2);
	
	//and4
	//secme 2 = and4
	and(and4, not2, or2);
	
	//secme 3 = lessi
	
	// ci+1 = or(and1, and3)
	or(ci_1, and1, and3);
	
	
	// select > or | nor
	wire or_nor;
	wire nor1;
	nor(nor1, ai, bi);
	mux_2 _mux2(or_nor, or1, nor1, aluOp[2]);
	
	
	wire [3:0] d;
	assign d[0] = and1;
	assign d[1] = or_nor;
	assign d[2] = and4;
	assign d[3] = lessi;
	
	wire [1:0] select;
	assign select[1] = aluOp[1];
	assign select[0] = aluOp[0];
	
	//result
	mux_4 _mux(ri, d, select);
	
endmodule
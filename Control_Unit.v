// Osman Suzer
//
// 131044051
//

module Control_Unit(opcode, RegWrite, ALUSrc, RegDst, MemtoReg, MemRead, MemWrite, Branch, BranchNotEq, ALUop, Jump, Unsigned);

	input [5:0] opcode;
	output RegWrite, ALUSrc, RegDst, MemtoReg, MemRead, MemWrite, Branch, BranchNotEq, Jump, Unsigned;
	output [3:0] ALUop;
	
	wire [5:0] opcode;
	wire RegWrite, ALUSrc, RegDst, MemtoReg, MemRead, MemWrite, Branch, BranchNotEq;
	wire [3:0] ALUop;
	
	wire [5:0] not_opcode;
	
	not(not_opcode[0], opcode[0]);
	not(not_opcode[1], opcode[1]);
	not(not_opcode[2], opcode[2]);
	not(not_opcode[3], opcode[3]);
	not(not_opcode[4], opcode[4]);
	not(not_opcode[5], opcode[5]);
	
	wire R_Type, rType, lw, sw, beq;
	
	and(R_Type, not_opcode[5], not_opcode[4], not_opcode[3], not_opcode[2], not_opcode[1], not_opcode[0]);
	and(lw, opcode[5], not_opcode[4], not_opcode[3], not_opcode[2], opcode[1], opcode[0]);
	and(sw, opcode[5], not_opcode[4], opcode[3], not_opcode[2], opcode[1], opcode[0]);
	and(beq, not_opcode[5], not_opcode[4], not_opcode[3], opcode[2], not_opcode[1], not_opcode[0]);
	and(Jump, not_opcode[5], not_opcode[4], not_opcode[3], not_opcode[2], opcode[1], not_opcode[0]);
	and(BranchNotEq, not_opcode[5], not_opcode[4], not_opcode[3], opcode[2], not_opcode[1], opcode[0]);
	
	//for immediate 
	wire AddImmediate, AddImmediateUnsigned, AndImmediate, OrImmediate, SetLessThanImmediate, SetLessThanImmediateUnsigned;
	and(AddImmediate, not_opcode[5], not_opcode[4], opcode[3], not_opcode[2], not_opcode[1], not_opcode[0]);
	and(AddImmediateUnsigned, not_opcode[5], not_opcode[4], opcode[3], not_opcode[2], not_opcode[1], opcode[0]);
	and(AndImmediate, not_opcode[5], not_opcode[4], opcode[3], opcode[2], not_opcode[1], not_opcode[0]);
	and(OrImmediate, not_opcode[5], not_opcode[4], opcode[3], opcode[2], not_opcode[1], opcode[0]);
	and(SetLessThanImmediate, not_opcode[5], not_opcode[4], opcode[3], not_opcode[2], opcode[1], not_opcode[0]);
	and(SetLessThanImmediateUnsigned, not_opcode[5], not_opcode[4], opcode[3], not_opcode[2], opcode[1], opcode[0]);
	
	// rType or immediate
	or(rType, R_Type, AddImmediate, AndImmediate, OrImmediate, SetLessThanImmediate, AddImmediateUnsigned, SetLessThanImmediateUnsigned);
	
	
	//RegWrite
	or(RegWrite, rType, lw);
	//ALUSrc
	or(ALUSrc, lw, sw, AddImmediate, AndImmediate, OrImmediate, SetLessThanImmediate, AddImmediateUnsigned, SetLessThanImmediateUnsigned);
	//RegDst
	assign RegDst = rType;
	//MemtoReg
	assign MemtoReg = lw;
	//MemRead
	assign MemRead = lw;
	//MemWrite
	assign MemWrite = sw;
	//Branch
	assign Branch = beq;
	//ALUop
	or(Unsigned, SetLessThanImmediateUnsigned, AddImmediateUnsigned);
	
	// ALUop is immediate or not
	wire [3:0]ALUop_0 = {{1'b1}, opcode[2:0]};
	wire [3:0]ALUop_1;

	// rType
	assign ALUop_1[3] = 0;
	assign ALUop_1[2] = 0;
	assign ALUop_1[1] = rType;
	assign ALUop_1[0] = beq;
	
	// select rType or immediate
	wire select;
	or(select, R_Type, lw, sw, beq);
	mux_2_for_4_bits _mux(ALUop, ALUop_0, ALUop_1, select);
	
endmodule
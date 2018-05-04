// Osman Suzer
//
// 131044051
//

module Control_Unit_testbench();

	reg [5:0] opcode;
	wire RegWrite, ALUSrc, RegDst, MemtoReg, MemRead, MemWrite, Branch, Jump;
	wire [1:0] ALUop;
	
	Control_Unit controlUnit(opcode, RegWrite, ALUSrc, RegDst, MemtoReg, MemRead, MemWrite, Branch, ALUop, Jump);
	
	
	initial begin

	opcode = 6'b000000;
	
	#1;
	
	opcode = 6'b100011;
	
	#1;
	
	opcode = 6'b101011;
	
	#1;
	
	opcode = 6'b000100;
	
	#1;
	opcode = 6'b000010;

	end
	
	initial begin
	$monitor("opcode =>%6b\n RegWrite=%1b, ALUSrc=%1b, RegDst=%1b, MemtoReg=%1b, MemRead=%1b, MemWrite=%1b, Branch=%1b, ALUop=%2b, Jump=%1b",
							opcode, RegWrite, ALUSrc, RegDst, MemtoReg, MemRead, MemWrite, Branch, ALUop, Jump);
	end
	
	
endmodule
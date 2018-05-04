// Osman Suzer
//
// 131044051
//

module ALU_Control_testbench();

	wire [2:0] aluCtr;
	reg [1:0] aluOp;
	reg [5:0] func;
	
	ALU_Control alu_ctr(aluCtr, func, aluOp);
	
	initial begin
	
   aluOp = 2'b10;
	func = 6'b100000;
	
	#1;
	
	func = 6'b100100;
	aluOp = 2'b10;
	
	#1;
	
	func = 6'b100101;
	aluOp = 2'b10;
	
	#1;
	
	func = 6'b100010;
	aluOp = 2'b01;
	

	end
	
	initial begin
	$monitor("aluOp =>%2b function=%6b, ALUCtr=%3b", aluOp,func, aluCtr);
	end
	
	
endmodule
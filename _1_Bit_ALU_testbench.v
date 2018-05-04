// Osman Suzer
//
// 131044051
//

module _1_Bit_ALU_testbench();
	reg ai, bi, ci;
	reg [2:0] aluOp;
	reg lessi;
	wire ri, ci_1;


	_1_Bit_ALU alu(ri, ci_1, ai, bi, ci, aluOp, lessi);

	
	initial begin
	//and

	ai =1; bi = 1; ci = 0;
	aluOp[2] = 0; aluOp[1] = 0; aluOp[0] = 0; 
	lessi = 0;
	
	#1;
	
	ai =0; bi = 0; ci = 0;
	aluOp[2] = 0; aluOp[1] = 0; aluOp[0] = 0; 
	lessi = 0;
	
	#1;
	
	ai =1; bi = 0; ci = 0;
	aluOp[2] = 0; aluOp[1] = 0; aluOp[0] = 0; 
	lessi = 0;


	#1
	//or
	ai =1; bi = 1; ci = 0;
	aluOp[2] = 0; aluOp[1] = 0; aluOp[0] = 1; 
	lessi = 0;
	
	#1;
	
	ai =0; bi = 0; ci = 0;
	aluOp[2] = 0; aluOp[1] = 0; aluOp[0] = 1; 
	lessi = 0;
	
	#1;
	
	ai =1; bi = 0; ci = 0;
	aluOp[2] = 0; aluOp[1] = 0; aluOp[0] = 1; 
	lessi = 0;

	#1;
	
	ai = 1; bi = 0; ci = 1;
	aluOp[2] = 0; aluOp[1] = 0; aluOp[0] = 1; 
	lessi = 0;
	
	
	//add
	#1;
	
	ai =0; bi = 0; ci = 0;
	aluOp[2] = 0; aluOp[1] = 1; aluOp[0] = 0; 
	lessi = 0;

	#1;
	
	ai = 1; bi = 0; ci = 0;
	aluOp[2] = 0; aluOp[1] = 1; aluOp[0] = 0; 
	lessi = 0;

	#1;
	
	ai =0; bi = 1; ci = 0;
	aluOp[2] = 0; aluOp[1] = 1; aluOp[0] = 0; 
	lessi = 0;

	#1;
	ai =1; bi = 1; ci = 0;
	aluOp[2] = 0; aluOp[1] = 1; aluOp[0] = 0; 
	lessi = 0;

	#1;
	ai =1; bi = 1; ci = 1;
	aluOp[2] = 0; aluOp[1] = 1; aluOp[0] = 0; 
	lessi = 0;

	#1;
	
	ai = 1; bi = 0; ci = 1;
	aluOp[2] = 0; aluOp[1] = 1; aluOp[0] = 0; 
	lessi = 0;
	
	#1;
	
	ai = 0; bi = 1; ci = 1;
	aluOp[2] = 0; aluOp[1] = 1; aluOp[0] = 0; 
	lessi = 0;
	
	//sustract
	#1;
	
	ai =0; bi = 0; ci = 1;
	aluOp[2] = 1; aluOp[1] = 1; aluOp[0] = 0; 
	lessi = 0;

	#1;
	ai =0; bi = 1; ci = 1;
	aluOp[2] = 1; aluOp[1] = 1; aluOp[0] = 0; 
	lessi = 0;

	#1;
	ai =1; bi = 1; ci = 1;
	aluOp[2] = 1; aluOp[1] = 1; aluOp[0] = 0; 
	lessi = 0;

	#1;
	
	ai = 1; bi = 0; ci = 1;
	aluOp[2] = 1; aluOp[1] = 1; aluOp[0] = 0; 
	lessi = 0;
	
	
	//set on less than
	#1;
	
	ai =0; bi = 0; ci = 0;
	aluOp[2] = 1; aluOp[1] = 1; aluOp[0] = 1; 
	lessi = 0;

	#1;
	ai =0; bi = 1; ci = 0;
	aluOp[2] = 1; aluOp[1] = 1; aluOp[0] = 1; 
	lessi = 0;

	#1;
	ai =1; bi = 0; ci = 0;
	aluOp[2] = 1; aluOp[1] = 1; aluOp[0] = 1; 
	lessi = 0;

	#1;
	ai = 1; bi = 1; ci = 0;
	aluOp[2] = 1; aluOp[1] = 1; aluOp[0] = 1; 
	lessi = 0;
	
	

	//nor
	#1;
	
	ai =0; bi = 0; ci = 0;
	aluOp[2] = 1; aluOp[1] = 0; aluOp[0] = 1; 
	lessi = 0;

	#1;
	ai =0; bi = 1; ci = 0;
	aluOp[2] = 1; aluOp[1] = 0; aluOp[0] = 1; 
	lessi = 0;

	#1;
	ai =1; bi = 0; ci = 0;
	aluOp[2] = 1; aluOp[1] = 0; aluOp[0] = 1; 
	lessi = 0;

	#1;
	ai = 1; bi = 1; ci = 0;
	aluOp[2] = 1; aluOp[1] = 0; aluOp[0] = 1; 
	lessi = 0;

	end
	
	initial begin
	$monitor("aluOp =>%3b ai=%1b, bi=%1b, ci=%1b, result=%1b, carry_out=%1b, lessi=%1b",aluOp,	ai, bi, ci, ri, ci_1, lessi);
	end
	
	
endmodule
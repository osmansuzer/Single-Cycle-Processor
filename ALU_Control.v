// Osman Suzer
//
// 131044051
//

module ALU_Control(aluCtr, func, aluOp);

	output [2:0] aluCtr;
	input [3:0] aluOp;
	input [5:0] func;
	
	wire [2:0] aluCtr_0;
	wire [2:0] aluCtr_1;
	wire [2:0] aluCtr;
	wire [3:0] aluOp;
	wire [5:0] func;
	
	wire and1;
	
	wire sll, srl;
	and(sll, ~func[5], ~func[4], ~func[3], ~func[2], ~func[1], ~func[0]);
	and(srl, ~func[5], ~func[4], ~func[3], ~func[2], func[1], ~func[0]);
	
	wire select;	
	or(select, sll, srl);
	
	wire [2:0] aluCtr_0_0, aluCtr_0_1;
	
	// for shift (sll or srl)
	assign aluCtr_0_1[2]= func[1];
	assign aluCtr_0_1[1] = ~func[1];
	assign aluCtr_0_1[0] = ~func[1];
	
	// for and, or, add, subs.., set less than 
	//aluCtr[2]
	and(and1, aluOp[1], func[1]);
	or(aluCtr_0_0[2], aluOp[0], and1);
	
	//aluCtr[1]
	wire not1, not2;
	not(not1, aluOp[1]);
	not(not2, func[2]);
	or(aluCtr_0_0[1], not1, not2);

	//aluCtr[0]
	wire or1;
	or(or1, func[3], func[0]);
	and(aluCtr_0_0[0], or1, aluOp[1]);
	
	// select shift or the others
	mux_2_for_1_bits _mux(aluCtr_0, aluCtr_0_0, aluCtr_0_1, select);
	
	wire x, y;
	
	// for immediate inst.
	and(aluCtr_1[2], ~aluOp[2], aluOp[1]);
	and(aluCtr_1[1], ~aluOp[2]);
	
	and(x, ~aluOp[2], aluOp[1]);
	and(y, aluOp[2], ~aluOp[1], aluOp[0]);
	or(aluCtr_1[0], x, y);
	
	// select first(shift or others) or immediate
	mux_2_for_1_bits _mux2(aluCtr, aluCtr_0, aluCtr_1, aluOp[3]);

endmodule
	
// Osman Suzer
//
// 131044051
//

module mux_2(result, d0, d1, select);

	input select;
	input d0, d1;

	output result;

	wire select, not_select, and1, and2, or1;
	wire[1:0] d;

	wire q;
	
	not(not_select, select);
	
	and(and1, not_select, d0);
	and(and2, select, d1);
	
	or(result, and1, and2);
	
endmodule
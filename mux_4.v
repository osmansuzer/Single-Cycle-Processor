// Osman Suzer
//
// 131044051
//

module mux_4(q, d, select);

	input[1:0] select;
	input[3:0] d;

	output q;

	wire q, q1, q2, q3, q4, not_select0, not_select1;
	wire[1:0]  select;
	wire[3:0]  d;

	not(not_select0, select[0]);
	not(not_select1, select[1]);

	and(q1, not_select0, not_select1, d[0]);
	and(q2, select[0], not_select1, d[1]);
	and(q3, not_select0,  select[1], d[2]);
	and(q4, select[0], select[1], d[3]);

	or(q, q1, q2, q3, q4);

endmodule
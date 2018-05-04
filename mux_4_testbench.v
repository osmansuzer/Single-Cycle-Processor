// Osman Suzer
//
// 131044051
//

module mux_4_testbench();
	

	reg[1:0] select;
	reg[3:0] d;
	wire q;
	
	mux_4 _mux(q, d, select);


	
	initial begin

	select[1] = 0; select[0] = 0;
	d[3] = 0; d[2] = 0; d[1] = 0; d[0] = 1;
	
	#1;
	
	select[1] = 0; select[0] = 0;
	d[3] = 1; d[2] = 1; d[1] = 1; d[0] = 0;
	
	#1;
	
	select[1] = 0; select[0] = 1;
	d[3] = 0; d[2] = 0; d[1] = 1; d[0] = 0;
	
	#1;
	
	select[1] = 1; select[0] = 0;
	d[3] = 0; d[2] = 1; d[1] = 0; d[0] = 0;
	
	#1;
	
	select[1] = 1; select[0] = 1;
	d[3] = 1; d[2] = 0; d[1] = 0; d[0] = 0;

	end
	
	initial begin
	$monitor("select =>%2b d=%4b, result=%1b",select,	d, q);
	end
	
	
endmodule
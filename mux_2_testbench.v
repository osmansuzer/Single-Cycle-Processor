// Osman Suzer
//
// 131044051
//

module mux_2_testbench();
	
	reg select;
	reg[1:0] d;
	wire q;
	
	mux_2 _mux(q, d[0], d[1], select);


	
	initial begin
	//and

	select = 0;
	d[1] = 0; d[0] = 1;
	
	#1;
	
	select = 1;
	d[1] = 1; d[0] = 0;
	
	end
	
	initial begin
	$monitor("select =>%1b d=%2b, result=%1b",select,d, q);
	end
	
	
endmodule
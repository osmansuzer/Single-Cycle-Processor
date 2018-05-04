// Osman Suzer
//
// 131044051
//

module mux_2_for_5_bits_testbench();
	
	reg select;
	reg [4:0] d0;
	reg [4:0] d1;
	
	wire [4:0] result;

	mux_2_for_32_bits  _mux(result, d0, d1, select);
	
	initial begin
	//and

	select = 0;
	d0 = 4'b1111;
	d1 = 4'b0000;
	
	#1;
	
	select = 1;
	d0 = 4'b0000;
	d1 = 4'b1111;
	
	end
	
	initial begin
	$monitor("select =>%1b\n  d0=%4b\n  d1=%4b\n  result=%4b\n",select,d0,d1, result);
	end
	
	
endmodule
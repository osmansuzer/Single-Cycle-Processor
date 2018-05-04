// Osman Suzer
//
// 131044051
//

module mux_2_for_32_bits_testbench();
	
	reg select;
	reg [31:0] d0;
	reg [31:0] d1;
	
	wire [31:0] result;

	mux_2_for_32_bits  _mux(result, d0, d1, select);
	
	initial begin
	//and

	select = 0;
	d0 = 32'b11111111111111111111111111111111;
	d1 = 32'b00000000000000000000000000000000;
	
	#1;
	
	select = 1;
	d0 = 32'b00000000000000000000000000000000;
	d1 = 32'b11111111111111111111111111111111;
	
	end
	
	initial begin
	$monitor("select =>%1b\n  d0=%32b\n  d1=%32b\n  result=%32b\n",select,d0,d1, result);
	end
	
	
endmodule
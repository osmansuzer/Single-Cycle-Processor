// Osman Suzer
//
// 131044051
//

module Sign_Extender_testbench();

	wire[31:0]extended;
	reg [15:0]extend;
	reg Unsigned;
	Sign_Extender extender(extended, extend, Unsigned);
	
	initial begin


	extend = 16'b1111111111000000;  
	Unsigned = 0;
	#1;
	
	extend = 16'b0000011111000000; 
	Unsigned = 0;
	#1;
	
	extend = 16'b0000000000000000;
	Unsigned = 0;
	#1
	
	extend = 16'b1111111111000000;  
	Unsigned = 1;
	#1;
	
	extend = 16'b0000011111000000; 
	Unsigned = 1;
	#1;
	end
	
	initial begin
	$monitor("Unsigned=%1b  Extend =>%16b ---->  Extended =%32b",Unsigned, extend, extended);
	end
	
	
endmodule
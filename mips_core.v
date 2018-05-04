// Osman Suzer
//
// 131044051
//

module mips_core(clock);
	
	input clock;

	// program counter register
	reg [31:0] pc;
	// for new value of pc
	wire [31:0] NextPC;
	// instruction wire
	wire [31:0] instruction;
	// signals
	wire RegWrite, ALUSrc, RegDst, MemtoReg,MemRead, MemWrite, Branch, BranchNotEq, Jump, Unsigned;
	// Aluop signal
	wire [3:0] ALUop;
	// for extend instruction[15:0]
	wire [31:0] extended;
	// Write Register 5 bits (mux)
	wire [4:0] writeRegister;
	// read_data_1 => ALU input 1
	// read_data_2 => mux
	wire [31:0] read_data_1, read_data_2;
	// write register data from result or mem 
	wire [31:0] write_data;
	// ALUCtr signal for ALU (product of ALU control)
	wire [2:0] aluCtr;
	// for ALU input 2 (extended or read_data_2)
	wire [31:0] aluWire2;
	// ALU result wire
	wire [31:0] result;
	// ALU outputs
	wire c32, Z, V;
	// read_data from memory
	wire [31:0] read_data;
	// select signal to select (branch or pc + 4)
	wire select;
	wire selectB; // select branch equal
	wire selectBN;	// select branch not equal
	// for shifted extended
	wire [31:0] shift_extended;
	
	
	// initial value is 0 for pc
	initial pc = 0;
	
	mips_instr_mem mips_instr_mem1(instruction, pc);
	Control_Unit control_unit(instruction[31:26], RegWrite, ALUSrc, RegDst, MemtoReg, MemRead, MemWrite, Branch, BranchNotEq, ALUop, Jump, Unsigned);
	Sign_Extender extender(extended, instruction[15:0], Unsigned);
	mux_2_for_5_bits _2_1_for5bits(writeRegister, instruction[20:16], instruction[15:11], regDst);
	mips_registers registers(read_data_1, read_data_2, write_data, instruction[25:21], instruction[20:16], writeRegister, RegWrite, clock);
	ALU_Control alu_control(aluCtr,instruction[5:0], ALUop);
	mux_2_for_32_bits _2_1_for32bits_1(aluWire2, read_data_2, extended, ALUSrc);
	_32_Bits_ALU alu(result, c32, Z, V, read_data_1, aluWire2, aluCtr, instruction[10:6]);
	mips_data_mem mem(read_data, result, read_data_2, memRead, memWrite);
	mux_2_for_32_bits _2_1_for32bits_2(write_data, result, read_data, memtoReg);
	
	and(selectB, Z, Branch);
	and(selectBN, ~Z, BranchNotEq);
	or(select, selectB, selectBN);
	assign shift_extended = extended << 2;
	// pc_counter = pc +4
	wire [31:0]pc_counter = pc + 4;
	// for branch (add_shift_extended = pc_counter + shift_extended)
	wire [31:0]add_shift_extended = pc_counter + shift_extended;
	wire [31:0] branc_or_pc;
	mux_2_for_32_bits _2_1_for32bits_3(branc_or_pc, pc_counter, add_shift_extended, select);
	
	//for jump instruction
	wire [27:0] pc_jump_last = instruction[25:0] << 2;
	wire [3:0] pc_jump_first = pc_counter[31:28];
	wire [31:0] pc_jump = {{pc_jump_first},{pc_jump_last}};
	// select jump or normal value
	mux_2_for_32_bits _2_1_for32bits_4(NextPC, branc_or_pc, pc_jump, Jump);
	
	always@(negedge clock) begin
		$display("Time:%2d, clk:%1b,\nSignals == >regWrite:%1b, ALUSrc:%1b, RegDst:%1b, MemtoReg:%1b, MemRead:%1b, MemWrite:%1b, Branch:%1b, ALUop:%4b, Jump:%1b Unsigned:%1b\nPC:%32b,\nNextPC:%32b\ninstruction:%32b\nALUinput1:%32b, ALUinput2:%32b\n ===> result:%32b\nALUCtr:%3b, c32:%1b, Z:%1b, V:%1b\n",
					$time,clock,RegWrite, ALUSrc, RegDst, MemtoReg, MemRead, MemWrite, Branch, ALUop, Jump, Unsigned, pc,NextPC, instruction, read_data_1, aluWire2, result, aluCtr,c32, Z, V);
		pc <= NextPC;
	end

endmodule
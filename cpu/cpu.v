`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:23:29 11/24/2016
// Design Name:   cpu
// Module Name:   D:/Junior/ComputerOrganization/CPU/jiyuan/cpu/cpu.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu;

	// Inputs
	reg rst;
	reg clkIn;
	reg dataReady;
	reg tbre;
	reg tsre;

	// Outputs
	wire ram1En;
	wire ram1We;
	wire ram1Oe;
	wire [17:0] ram1Addr;
	wire ram2En;
	wire ram2We;
	wire ram2Oe;
	wire [17:0] ram2Addr;
	wire [6:0] digit1;
	wire [6:0] digit2;
	wire [15:0] led;
	wire hs;
	wire vs;
	wire [2:0] redOut;
	wire [2:0] greenOut;
	wire [2:0] blueOut;

	// Bidirs
	wire rdn;
	wire wrn;
	wire [15:0] ram1Data;
	wire [15:0] ram2Data;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.rst(rst), 
		.clkIn(clkIn), 
		.dataReady(dataReady), 
		.tbre(tbre), 
		.tsre(tsre), 
		.rdn(rdn), 
		.wrn(wrn), 
		.ram1En(ram1En), 
		.ram1We(ram1We), 
		.ram1Oe(ram1Oe), 
		.ram1Data(ram1Data), 
		.ram1Addr(ram1Addr), 
		.ram2En(ram2En), 
		.ram2We(ram2We), 
		.ram2Oe(ram2Oe), 
		.ram2Data(ram2Data), 
		.ram2Addr(ram2Addr), 
		.digit1(digit1), 
		.digit2(digit2), 
		.led(led), 
		.hs(hs), 
		.vs(vs), 
		.redOut(redOut), 
		.greenOut(greenOut), 
		.blueOut(blueOut)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		clkIn = 0;
		dataReady = 0;
		tbre = 0;
		tsre = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


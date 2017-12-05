----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:10:05 11/19/2015 
-- Design Name: 
-- Module Name:    cpu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cpu is
	port(
			rst : in std_logic; --reset
			clk_hand : in std_logic; --时钟源  默认为50M  可以通过修改绑定管脚来改变
			clk_50 : in std_logic;
			opt : in std_logic;	--选择输入时钟（为手动或者50M）
			
			
			--串口
			dataReady : in std_logic;   
			tbre : in std_logic;
			tsre : in std_logic;
			rdn : inout std_logic;
			wrn : inout std_logic;
			
			--RAM1  存放数据
			ram1En : out std_logic;
			ram1We : out std_logic;
			ram1Oe : out std_logic;
			ram1Data : inout std_logic_vector(15 downto 0);
			ram1Addr : out std_logic_vector(17 downto 0);
			
			--RAM2 存放程序和指令
			ram2En : out std_logic;
			ram2We : out std_logic;
			ram2Oe : out std_logic;
			ram2Data : inout std_logic_vector(15 downto 0);
			ram2Addr : out std_logic_vector(17 downto 0);
			
			--debug  digit1、digit2显示PC值，led显示当前指令的编码
			digit1 : out std_logic_vector(6 downto 0);	--7位数码管1
			digit2 : out std_logic_vector(6 downto 0);	--7位数码管2
			led : out std_logic_vector(15 downto 0);
			
			hs,vs : out std_logic;
			redOut, greenOut, blueOut : out std_logic_vector(2 downto 0);
		
			--Flash
			flashAddr : out std_logic_vector(22 downto 0);		--flash地址线
			flashData : inout std_logic_vector(15 downto 0);	--flash数据线
			
			flashByte : out std_logic;	--flash操作模式，常置'1'
			flashVpen : out std_logic;	--flash写保护，常置'1'
			flashRp : out std_logic;	--'1'表示flash工作，常置'1'
			flashCe : out std_logic;	--flash使能
			flashOe : out std_logic;	--flash读使能，'0'有效，每次读操作后置'1'
			flashWe : out std_logic		--flash写使能
	);
			
end cpu;

architecture Behavioral of cpu is
	
	component fontRom
		port (
				clka : in std_logic;
				addra : in std_logic_vector(10 downto 0);
				douta : out std_logic_vector(7 downto 0)
		);
	end component;
	
--	component digit
--		port (
--				clka : in std_logic;
--				addra : in std_logic_vector(14 downto 0);
--				douta : out std_logic_vector(23 downto 0)
--			);
--	end component;
	
	component VGA_Controller
		port (
	--VGA Side
		hs,vs	: out std_logic;		--行同步、场同步信号
		oRed	: out std_logic_vector (2 downto 0);
		oGreen	: out std_logic_vector (2 downto 0);
		oBlue	: out std_logic_vector (2 downto 0);
	--RAM side
--		R,G,B	: in  std_logic_vector (9 downto 0);
--		addr	: out std_logic_vector (18 downto 0);
	-- data
		r0, r1, r2, r3, r4,r5,r6,r7 : in std_logic_vector(15 downto 0);
	-- font rom
		romAddr : out std_logic_vector(10 downto 0);
		romData : in std_logic_vector(7 downto 0);
	-- pc
		PC : in std_logic_vector(15 downto 0);
		CM : in std_logic_vector(15 downto 0);
		Tdata : in std_logic_vector(15 downto 0);
		SPdata : in std_logic_vector(15 downto 0);
		IHdata : in std_logic_vector(15 downto 0);
	--Control Signals
		reset	: in  std_logic;
		CLK_in : in std_logic			--100M时钟输入
	);	
	end component;
	
	component MemoryUnit
	port(
		--时钟
		clk : in std_logic;
		rst : in std_logic;
		
		--串口
		data_ready : in std_logic;		--数据准备信号，='1'表示串口的数据已准备好（读串口成功，可显示读到的data）
		tbre : in std_logic;				--发送数据标志
		tsre : in std_logic;				--数据发送完毕标志，tsre and tbre = '1'时写串口完毕
		wrn : out std_logic;				--写串口，初始化为'1'，先置为'0'并把RAM1data赋好，再置为'1'写串口
		rdn : out std_logic;				--读串口，初始化为'1'并将RAM1data赋为"ZZ..Z"，
												--若data_ready='1'，则把rdn置为'0'即可读串口（读出数据在RAM1data上）
		
		--RAM1（DM）和RAM2（IM）
		MemRead : in std_logic;			--控制读DM的信号，='1'代表需要读
		MemWrite : in std_logic;		--控制写DM的信号，='1'代表需要写
		
		dataIn : in std_logic_vector(15 downto 0);		--写内存时，要写入DM或IM的数据
		
		ramAddr : in std_logic_vector(15 downto 0);		--读DM/写DM/写IM时，地址输入
		PCOut : in std_logic_vector(15 downto 0);			--读IM时，地址输入
		PCMuxOut : in std_logic_vector(15 downto 0);	
		PCKeep : in std_logic;
		dataOut : out std_logic_vector(15 downto 0);		--读DM时，读出来的数据/读出的串口状态
		insOut : out std_logic_vector(15 downto 0);		--读IM时，出来的指令
		
		ram1_addr : out std_logic_vector(17 downto 0); 	--RAM1地址总线
		ram2_addr : out std_logic_vector(17 downto 0); 	--RAM2地址总线
		ram1_data : inout std_logic_vector(15 downto 0);--RAM1数据总线
		ram2_data : inout std_logic_vector(15 downto 0);--RAM2数据总线
		
		ram2AddrOutput : out std_logic_vector(17 downto 0);
		
		ram1_en : out std_logic;		--RAM1使能，='1'禁止
		ram1_oe : out std_logic;		--RAM1读使能，='1'禁止；
		ram1_we : out std_logic;		--RAM1写使能，='1'禁止
		ram2_en : out std_logic;		--RAM2使能，='1'禁止
		ram2_oe : out std_logic;		--RAM2读使能，='1'禁止
		ram2_we : out std_logic;		--RAM2写使能，='1'禁止
		
		MemoryState : out std_logic_vector(1 downto 0);
		FlashStateOut : out std_logic_vector(2 downto 0);
		flashFinished : out std_logic;
		
		--Flash
		flash_addr : out std_logic_vector(22 downto 0);		--flash地址线
		flash_data : inout std_logic_vector(15 downto 0);	--flash数据线
		
		flash_byte : out std_logic;	--flash操作模式，常置'1'
		flash_vpen : out std_logic;	--flash写保护，常置'1'
		flash_rp : out std_logic;		--'1'表示flash工作，常置'1'
		flash_ce : out std_logic;		--flash使能
		flash_oe : out std_logic;		--flash读使能，'0'有效，每次读操作后置'1'
		flash_we : out std_logic		--flash写使能
	);
	end component;
	

	--时钟
	component Clock
	port ( 
		rst : in STD_LOGIC;
		clk : in  STD_LOGIC;
		
		clkout :out STD_LOGIC;
		clk1 : out  STD_LOGIC;
		clk2 : out STD_LOGIC
	);
	end component;
	
	
	--ALU运算器
	component ALU
	port(
		Asrc       	 :  in STD_LOGIC_VECTOR(15 downto 0);
		Bsrc       	 :  in STD_LOGIC_VECTOR(15 downto 0);
		ALUop		  	 :  in STD_LOGIC_VECTOR(3 downto 0);
		ALUresult  	 :  out STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000"; -- 默认设为全0
		BranchJudge  :  out STD_LOGIC
		);
	end component;
	
	--选择器：ALU的第一个计算数
	component ALUMuxA is 
	port(
		--控制信号
		ForwardA : in std_logic_vector(1 downto 0);
		--供选择数据
		readData1 : in std_logic_vector(15 downto 0);
		ExeMemALUResult : in std_logic_vector(15 downto 0);	-- 上条指令的ALU结果（严格说是MFPCMux的结果）
		MemWbWriteData : in std_logic_vector(15 downto 0);	   -- 上上条指令（包括插入的NOP）将写回的寄存器值(WriteData)
		--选择结果输出
		ALUSrcA : out std_logic_vector(15 downto 0)
	);
	end component;
	
	--选择器：ALU的第二个计算数
	component ALUMuxB
	port(
		--控制信号
		ForwardB : in std_logic_vector(1 downto 0);
		ALUSrcBIsImme  : in std_logic;
		--供选择数据
		readData2 : in std_logic_vector(15 downto 0);
		imme 	    : in std_logic_vector(15 downto 0);
		ExeMemALUResult : in std_logic_vector(15 downto 0);	-- 上条指令的ALU结果（严格说是MFPCMux的结果）
		MemWbWriteData : in std_logic_vector(15 downto 0);	   -- 上上条指令（包括插入的NOP）将写回的寄存器值(WriteData)
		--选择结果输出
		ALUSrcB : out std_logic_vector(15 downto 0)
	);	
	end component;
	
	
	--产生所有控制信号的控制器
	component Controller
	port(	
		commandIn : in std_logic_vector(15 downto 0);
		rst : in std_logic;
		controllerOut :  out std_logic_vector(20 downto 0)
		-- RegWrite(1) RegDst(3) ReadReg1(3) ReadReg2(1) immeSelect(3) ALUSrcB(1) 
		-- ALUOp(4) MemRead(1) MemWrite(1) MemToReg(1) jump(1) MFPC(1)
	);
	end component;
	
	--选择新PC的单元
	component PCMux
	port(
		PCAddOne : in std_logic_vector(15 downto 0);	 --PC+1
		IdEximme : in std_logic_vector(15 downto 0);  --用于计算Branch跳转的PC值=IdEXEimme+IdExPC
		IdExPC : in std_logic_vector(15 downto 0);	 --用于计算Branch跳转的PC值=IdEXEimme+IdExPC
		AsrcOut : in std_logic_vector(15 downto 0);	 --对于JR指令，跳转地址为ASrcOut
		
		jump : in std_logic;					--jump是由总控制器Controller产生的信号
		BranchJudge : in std_logic;		--是由ALU产生的控制信号，表示B型跳转成功
		PCRollback : in std_logic;			--SW数据冲突时，PC需要回退到SW下一条指令①的地址，
													--而当前的PC+1是③的地址，所以此时PCOut = PCAddOne - 2;
		
		PCOut : out std_logic_vector(15 downto 0)
	);
	end component;
	
	--（MFPC指令）从PC+1和ALUResult中选择一个作为“真正的ALUResult”
	component MFPCMux
	port(
		PCAddOne  : in std_logic_vector(15 downto 0);	
		RawALUResult : in std_logic_vector(15 downto 0); -- ALU计算结果
		isMFPC		 : in std_logic;		-- isMFPC = '1' 表示当前指令是MFPC，选择PC+1的值
		
		RealALUResult : out std_logic_vector(15 downto 0)
	);
	end component;
	
	
	--EX/MEM阶段寄存器
	component ExMemRegisters
	port(
		clk : in std_logic;
		rst : in std_logic;
		flashFinished : in std_logic;
		--数据输入
		rdIn : in std_logic_vector(3 downto 0);
		MFPCMuxIn : in std_logic_vector(15 downto 0);
		readData2In : in std_logic_vector(15 downto 0); --供SW语句写内存
		--信号输入
		regWriteIn : in std_logic;
		memReadIn : in std_logic;
		memWriteIn : in std_logic;
		memToRegIn : in std_logic;

		--数据输出
		rdOut : out std_logic_vector(3 downto 0);
		ALUResultOut : out std_logic_vector(15 downto 0);
		readData2Out : out std_logic_vector(15 downto 0); --供SW语句写内存
		--信号输出
		regWriteOut : out std_logic;
		memReadOut : out std_logic;
		memWriteOut : out std_logic;
		memToRegOut : out std_logic
	);
	end component;
	
	--转发单元
	component ForwardController
	port(
		ExMemRd : in std_logic_vector(3 downto 0);   --
		MemWbRd : in std_logic_vector(3 downto 0);   --
		
		--ExMemRegWrite : in std_logic;
		--MemWbRegWrite : in std_logic;    --由"1111"判断没有源寄存器
		
		IdExALUsrcB : in std_logic;
		IdExMemWrite : in std_logic;
		
		IdExReg1 : in std_logic_vector(3 downto 0);  --本条指令的源寄存器1
		IdExReg2 : in std_logic_vector(3 downto 0);  --本条指令的源寄存器2
		
		ForwardA : out std_logic_vector(1 downto 0);
		ForwardB : out std_logic_vector(1 downto 0);
		ForwardSW : out std_logic_vector(1 downto 0)

	);
	end component;
	
	--LW数据冲突控制单元
	component HazardDetectionUnit
	port(
		IdExeMemRead: in std_logic;
		IdExeWriteReg: in std_logic_vector(3 downto 0);
		readReg1: in std_logic_vector(3 downto 0);
		readReg2: in std_logic_vector(3 downto 0);
		
		IdExeFlush_LW: out std_logic;
		PCKeep: out std_logic;
		IfIdKeep_LW: out std_logic
	);
	end component;
	
	--ID/EX阶段寄存器
	component IdExRegisters
	port(
		clk : in std_logic;
		rst : in std_logic;
		flashFinished : in std_logic;
		LW_IdExFlush : in std_logic;		--LW数据冲突用
		Branch_IdExFlush : in std_logic;	--跳转时用
		Jump_IdExFlush : in std_logic;	--JR跳转时用
		SW_IdExFlush : in std_logic;		--SW结构冲突用
		
		PCIn : in std_logic_vector(15 downto 0);
		rdIn : in std_logic_vector(3 downto 0);		--目的寄存器："0xxx"-R0~R7,"1000"-SP,"1001"-IH,"1010"-T,"1110"-没有目的寄存器
		Reg1In : in std_logic_vector(3 downto 0);		--源寄存器1："0xxx"-R0~R7,"1000"-SP,"1001"-IH,"1010"-T,"1111"-没有源寄存器1
		Reg2In : in std_logic_vector(3 downto 0);		--源寄存器2："0xxx"-R0~R7,"1111"-没有源寄存器2
		ALUSrcBIn : in std_logic;							--控制信号ALUSrcB：'0'-Reg2,'1'-imme
		ReadData1In : in std_logic_vector(15 downto 0);	--源寄存器1的值
		ReadData2In : in std_logic_vector(15 downto 0);	--源寄存器2的值
		immeIn : in std_logic_vector(15 downto 0);		--扩展后的立即数
		
		MFPCIn : in std_logic;
		regWriteIn : in std_logic;
		memWriteIn : in std_logic;
		memReadIn : in std_logic;
		memToRegIn : in std_logic;
		jumpIn : in std_logic;
		ALUOpIn : in std_logic_vector(3 downto 0);		--Controller生成的控制信号
		
	
		PCOut : out std_logic_vector(15 downto 0);
		rdOut : out std_logic_vector(3 downto 0);
		Reg1Out : out std_logic_vector(3 downto 0);
		Reg2Out : out std_logic_vector(3 downto 0);
		ALUSrcBOut : out std_logic;
		ReadData1Out : out std_logic_vector(15 downto 0);
		ReadData2Out : out std_logic_vector(15 downto 0);			
		immeOut : out std_logic_vector(15 downto 0);
		
		MFPCOut : out std_logic;
		regWriteOut : out std_logic;
		memWriteOut : out std_logic;
		memReadOut : out std_logic;
		memToRegOut : out std_logic;
		jumpOut : out std_logic;
		ALUOpOut : out std_logic_vector(3 downto 0)
	);
	end component;
	
	--IF/ID阶段寄存器
	component IfIdRegisters
	port(
		rst : in std_logic;
		clk : in std_logic;
		flashFinished : in std_logic;
		
		commandIn : in std_logic_vector(15 downto 0);
		PCIn : in std_logic_vector(15 downto 0); 
		IfIdKeep : in std_logic;				--LW数据冲突用
		Branch_IfIdFlush : in std_logic;		--跳转时用
		Jump_IfIdFlush : in std_logic;		--JR跳转时用
		SW_IfIdFlush : in std_logic;			--SW结构冲突用
		
		rx : out std_logic_vector(2 downto 0);		--Command[10:8]
		ry : out std_logic_vector(2 downto 0);		--Command[7:5]
		rz : out std_logic_vector(2 downto 0);		--Command[4:2]
		imme_10_0 : out std_logic_vector(10 downto 0);	--Command[10:0]
		commandOut : out std_logic_vector(15 downto 0);
		PCOut : out std_logic_vector(15 downto 0)  --PC+1用于MFPC指令的EXE段
	);
	end component;
	
	--立即数扩展单元
	component ImmeExtendUnit
	port(
		 immeIn : in std_logic_vector(10 downto 0);		--取指令的[10:0]位，作为可能的立即数输入
		 immeSelect : in std_logic_vector(2 downto 0);  --由总控制器Controller产生
		 
		 immeOut : out std_logic_vector(15 downto 0)		--扩展后的立即数
	);
	end component;
	
	--MEM/WB阶段寄存器
	component MemWbRegisters
		port(
			clk : in std_logic;
			rst : in std_logic;
			flashFinished : in std_logic;
			--数据
			readMemDataIn : in std_logic_vector(15 downto 0);	--DataMemory读出的数据
			ALUResultIn : in std_logic_vector(15 downto 0);		--ALU的计算结果
			rdIn : in std_logic_vector(3 downto 0);				--目的寄存器
			--控制信号
			regWriteIn : in std_logic;		--是否要写回
			memToRegIn : in std_logic;		--写回时选择readMemDataIn（'1'）还是ALUResultIn（'0'）
			
			dataToWB : out std_logic_vector(15 downto 0);		--写回的数据
			rdOut : out std_logic_vector(3 downto 0);				--目的寄存器："0xxx"-R0~R7,"1000"-SP,"1001"-IH,"1010"-T,"1110"-没有目的寄存器
			regWriteOut : out std_logic								--是否要写回
		);
	end component;
	
	--PC加法器 实现PC+1
	component PCAdder
		port( 
			adderIn : in std_logic_vector(15 downto 0);
			adderOut : out std_logic_vector(15 downto 0)
		);
	end component;
	
	--PC寄存器
	component PCRegister
		port(	
			rst,clk : in std_logic;
			flashFinished : in std_logic;
			PCKeep : in std_logic;		--由HazardDetectionUnit产生的控制信号
			PCIn : in std_logic_vector(15 downto 0);		--取PCMux的输出值（选出来的PC值）
			PCOut : out std_logic_vector(15 downto 0)		--送给IM去取指的PC
		);
	end component;
	
	--源寄存器1选择器
	component ReadReg1Mux
		port(
			rx : in std_logic_vector(2 downto 0);
			ry : in std_logic_vector(2 downto 0);			--R0~R7中的一个
			
			ReadReg1 : in std_logic_vector(2 downto 0);		--由总控制器Controller生成的控制信号
			
			ReadReg1Out : out std_logic_vector(3 downto 0)  --"0XXX"代表R0~R7，"1000"=SP,"1001"=IH, "1010"=T, "1111"=没有
		);
	end component;
	
	--源寄存器2选择器
	component ReadReg2Mux
		port(
			rx : in std_logic_vector(2 downto 0);
			ry : in std_logic_vector(2 downto 0);			--R0~R7中的一个
			
			ReadReg2 : in std_logic;					--由总控制器Controller生成的控制信号
			
			ReadReg2Out : out std_logic_vector(3 downto 0)  --"0XXX"代表R0~R7, "1111"=没有
		);
	end component;
	
	--目的寄存器选择器
	component RdMux
		port(
			rx : in std_logic_vector(2 downto 0);
			ry : in std_logic_vector(2 downto 0);
			rz : in std_logic_vector(2 downto 0);			--R0~R7中的一个
			
			RegDst : in std_logic_vector(2 downto 0);		--由总控制器Controller生成的控制信号
			
			rdOut : out std_logic_vector(3 downto 0)		--"0XXX"代表R0~R7，"1000"=SP,"1001"=IH, "1010"=T, "1111"=没有
		);
	end component;
	
	--寄存器堆
	component Registers
		port(
			clk : in std_logic;
			rst : in std_logic;
			flashFinished : in std_logic;
			
			ReadReg1In : in std_logic_vector(3 downto 0);  --"0XXX"代表R0~R7，"1000"=SP,"1001"=IH, "1010"=T
			ReadReg2In : in std_logic_vector(3 downto 0);  --"0XXX"代表R0~R7
			
			WriteReg : in std_logic_vector(3 downto 0);	  --由WB阶段传回：目的寄存器
			WriteData : in std_logic_vector(15 downto 0);  --由WB阶段传回：写目的寄存器的值
			RegWrite : in std_logic;							  --由WB阶段传回：RegWrite（写目的寄存器）控制信号
			
			r0Out, r1Out, r2Out,r3Out,r4Out,r5Out,r6Out,r7Out : out std_logic_vector(15 downto 0);	--8个普通寄存器
			
			ReadData1 : out std_logic_vector(15 downto 0); --读出的寄存器1的值
			ReadData2 : out std_logic_vector(15 downto 0); --读出的寄存器2的值
			dataT : out std_logic_vector(15 downto 0);
			dataSP : out std_logic_vector(15 downto 0);
			dataIH : out std_logic_vector(15 downto 0);
			
			RegisterState : out std_logic_vector(1 downto 0)
		);
	end component;
	
	--SW写指令内存 结构冲突
	component StructConflictUnit
	port(
		IdExeMemWrite: in std_logic;
		ALUResult: in std_logic_vector(15 downto 0);
		IfIdFlush_StructConflict: out std_logic;
		IdExeFlush_StructConflict: out std_logic;
		PCRollBack: out std_logic
	);
	end component;
	
	component MemWriteDataMux
	port(
		--控制信号
		ForwardSW : in std_logic_vector(1 downto 0);
		--供选择数据
		readData2 : in std_logic_vector(15 downto 0);
		ExeMemALUResult : in std_logic_vector(15 downto 0);	-- 上条指令的ALU结果（严格说是MFPCMux的结果）
		MemWbResult : in std_logic_vector(15 downto 0);	   -- 上上条指令（包括插入的NOP）将写回的寄存器值(WriteData)
		--选择结果输出
		WriteData : out std_logic_vector(15 downto 0)
	);
	end component;

	component dcm 
		port ( CLKIN_IN   : in    std_logic; 
				 RST_IN     : in    std_logic; 
				 CLKFX_OUT  : out   std_logic; 
				 CLK0_OUT   : out   std_logic; 
				 CLK2X_OUT  : out   std_logic; 
				 LOCKED_OUT : out   std_logic
		);
	end component; 
	
	
	--以下的signal都是“全局变量”，来自所有component的out
	
	--dcm
	signal CLKFX_OUT : std_logic;
	signal CLK0_OUT : std_logic;
	signal CLK2X_OUT : std_logic;
	signal LOCKED_OUT : std_logic;
	
	--clock
	signal clk : std_logic;
	signal clk_3 : std_logic;
	signal clk_registers : std_logic;
	
	--PCRegister
	signal PCOut : std_logic_vector(15 downto 0); 
	
	--PCAdder
	signal PCAddOne : std_logic_vector(15 downto 0);
	
	--IfIdRegisters
	signal rx, ry, rz :std_logic_vector(2 downto 0);
	signal imme_10_0 : std_logic_vector(10 downto 0);
	signal IfIdCommand, IfIdPC : std_logic_vector(15 downto 0);
	
	--RdMux
	signal rdMuxOut : std_logic_vector(3 downto 0);
	
	--controller
	signal controllerOut : std_logic_vector(20 downto 0);
	
	--Registers
	signal ReadData1, ReadData2 : std_logic_vector(15 downto 0);
	signal r0,r1,r2,r3,r4,r5,r6,r7,dataT,dataSP,dataIH : std_logic_vector(15 downto 0);
	signal RegisterState : std_logic_vector(1 downto 0);
	
	--ImmExtend
	signal extendedImme : std_logic_vector(15 downto 0);
	
	--IdExRegisters
	signal IdExPC : std_logic_vector(15 downto 0);
	signal IdExRd : std_logic_vector(3 downto 0);
	signal IdExReg1, IdExReg2 : std_logic_vector(3 downto 0);
	signal IdExALUSrcB : std_logic;
	signal IdExReadData1, IdExReadData2 : std_logic_vector(15 downto 0);
	signal IdExImme : std_logic_vector(15 downto 0);
	signal IdExRegWrite,IdExMemWrite,IdExMemRead,IdExMemToReg,IdExMFPC,IdExJump : std_logic;
	signal IdExALUOp : std_logic_vector(3 downto 0);
	
	--ExMemRegisters
	
	signal ExMemRd : std_logic_vector(3 downto 0);
	signal ExMemReadData2 : std_logic_vector(15 downto 0);
	signal ExMemALUResult : std_logic_vector(15 downto 0);	--这是MFPCMux选择后的结果
	
	signal ExMemRegWrite : std_logic;
	signal ExMemRead, ExMemWrite, ExMemToReg: std_logic;
	
	--ForwardController
	signal ForwardA, ForwardB, ForwardSW : std_logic_vector(1 downto 0);
	
	--MemWbRegisters
	signal rdToWB : std_logic_vector(3 downto 0);
	signal dataToWB : std_logic_vector(15 downto 0);
	signal MemWbRegWrite : std_logic;
	
	--AMux
	signal AMuxOut : std_logic_vector(15 downto 0);
	
	--BMux
	signal BMuxOut : std_logic_vector(15 downto 0);
	
	--ALU
	signal ALUResult : std_logic_vector(15 downto 0);
	signal BranchJudge : std_logic;
	
	--PCMux
	signal PCMuxOut : std_logic_vector(15 downto 0);
	
	
	--HazardDetectionUnit
	signal PCKeep : std_logic;
	signal IfIdKeep : std_logic;
	signal LW_IdExFlush : std_logic;
	
		
	--MemoryUnit （有一大部分都已在cpu的port里体现）
	signal DMDataOut : std_logic_vector(15 downto 0);
	signal IMInsOut : std_logic_vector(15 downto 0);
	signal MemoryState : std_logic_vector(1 downto 0);
	signal FlashStateOut : std_logic_vector(2 downto 0);
		
	--SW写指令内存（结构冲突）
	signal SW_IfIdflush : std_logic;
	signal SW_IdExFlush : std_logic;
	signal PCRollback : std_logic;
	
	--ReadReg1Mux、2Mux的signal们
	signal ReadReg1MuxOut : std_logic_vector(3 downto 0);
	signal ReadReg2MuxOut : std_logic_vector(3 downto 0);
	
	--MFPCMux 
	signal MFPCMuxOut : std_logic_vector(15 downto 0);
	
	--digit rom
--	signal digitRomAddr : std_logic_vector(14 downto 0);
--	signal digitRomData : std_logic_vector(23 downto 0);
	
	--font rom
	signal fontRomAddr : std_logic_vector(10 downto 0);
	signal fontRomData : std_logic_vector(7 downto 0);
	
	--WriteDataMux
	signal WriteDataOut : std_logic_vector(15 downto 0);
	
	signal ram2AddrOutput : std_logic_vector(17 downto 0);
	signal flashFinished : std_logic;
	
	
	signal clkIn_clock : std_logic;	--传给clock.vhd的输入时钟
	signal always_zero : std_logic := '0';	--恒为零的信号
	
begin
	u1 : PCRegister
	port map(	
			rst => rst,
			clk => clk_3,
			flashFinished => flashFinished,
			PCKeep => PCKeep,
			PCIn => PCMuxOut,
			PCOut => PCOut
	);
		
	u2 : PCAdder
	port map( 
			adderIn => PCOut,
			adderOut => PCAddOne
	);
		
	u3 : 	IfIdRegisters
	port map(
			rst => rst,
			clk => clk_3,
			flashFinished => flashFinished,
			commandIn => IMInsOut,
			PCIn => PCAddOne,
			IfIdKeep => IfIdKeep,
			Branch_IfIdFlush => BranchJudge, 
			Jump_IfIdFlush => IdExJump,
			SW_IfIdFlush => SW_IfIdFlush,
			
			rx => rx,
			ry => ry,
			rz => rz,
			imme_10_0 => imme_10_0,
			commandOut => IfIdCommand,
			PCOut => IfIdPC
		);
		
	u4 : RdMux
	port map(
			rx => rx,
			ry => ry,
			rz => rz,
			
			RegDst => controllerOut(19 downto 17),
			rdOut => rdMuxOut
		);
		
	u5 : Controller
	port map(	
			commandIn => IfIdCommand,
			rst => rst,
			controllerOut => controllerOut
			-- RegWrite(20) RegDst(19-17) ReadReg1(16-14) ReadReg2(13) 
			-- immeSelect(12-10) ALUSrcB(9) ALUOp(8-5) 
			-- MemRead(4) MemWrite(3) MemToReg(2) jump(1) MFPC(0)
		);
		
	u6 : Registers
	port map(
			clk => clk,
			rst => rst,
			
			ReadReg1In => ReadReg1MuxOut,
			ReadReg2In => ReadReg2MuxOut,
			
			--这三条来自MEM/WB段寄存器（因为发生在写回段）
			WriteReg => rdToWB,
			WriteData => dataToWB,
			RegWrite => MemWbRegWrite,
			
			flashFinished => flashFinished,
			
			r0Out => r0,
			r1Out => r1,
			r2Out => r2,
			r3Out => r3,
			r4Out => r4,
			r5Out => r5,
			r6Out => r6,
			r7Out => r7,
			dataT => dataT,
			dataSP => dataSP,
			dataIH => dataIH,
			RegisterState => RegisterState,
			
			ReadData1 => ReadData1,
			ReadData2 => ReadData2
		);
		
	u7 : ImmeExtendUnit
	port map(
			 immeIn => imme_10_0,
			 immeSelect => ControllerOut(12 downto 10),
			 
			 immeOut => extendedImme
		);
		
	u8 : IdExRegisters
	port map(
			clk => clk_3,
			rst => rst,
			flashFinished => flashFinished,
			
			LW_IdExFlush => LW_IdExFlush,
			Branch_IdExFlush => BranchJudge,
			Jump_IdExFlush => IdExJump,
			SW_IdExFlush => SW_IdExFlush,
			
			PCIn => IfIdPC,
			rdIn => rdMuxOut,
			Reg1In => ReadReg1MuxOut,
			Reg2In => ReadReg2MuxOut,
			ALUSrcBIn => controllerOut(9),
			ReadData1In => ReadData1,
			ReadData2In => ReadData2,
			immeIn => extendedImme,
			
			MFPCIn => controllerOut(0),
			regWriteIn => controllerOut(20),
			memWriteIn => controllerOut(3),
			memReadIn => controllerOut(4),
			memToRegIn => controllerOut(2),
			jumpIn => controllerOut(1),
			ALUOpIn => controllerOut(8 downto 5),
		
			PCOut => IdExPC,
			rdOut => IdExRd,
			Reg1Out => IdExReg1,
			Reg2Out => IdExReg2,
			ALUSrcBOut => IdExALUSrcB,
			ReadData1Out => IdExReadData1,
			ReadData2Out => IdExReadData2,
			immeOut => IdExImme,
			
			MFPCOut => IdExMFPC,
			regWriteOut => IdExRegWrite,
			memWriteOut => IdExMemWrite,
			memReadOut => IdExMemRead,
			memToRegOut => IdExMemToReg,
			jumpOut => IdExJump,
			ALUOpOut => IdExALUOp
		);
		
	u9 : ALUMuxA
		port map(
			ForwardA => ForwardA,
			
			readData1 => IdExReadData1,
			ExeMemALUResult => ExMemALUResult,
			MemWbWriteData => dataToWB,
			
			ALUSrcA => AMuxOut
		);
		
	u10 : ALUMuxB
	port map(
			ForwardB => ForwardB,
			ALUSrcBIsImme => IdExALUSrcB,
			
			readData2 => IdExReadData2,
			imme => IdExImme,
			ExeMemALUResult => ExMemALUResult,
			MemWbWriteData => dataToWB,
			
			ALUSrcB => BMuxOut
		);	
		
	u11 : ForwardController
	port map(
			ExMemRd => ExMemRd,
			MemWbRd => rdToWB,
			
			--ExMemRegWrite => ExMemRegWrite,
			--MemWbRegWrite => WB,
			
			IdExALUsrcB => IdExALUSrcB,
			IdExMemWrite => IdExMemWrite,
			
			IdExReg1 => IdExReg1,
			IdExReg2 => IdExReg2,
			
			ForwardA => ForwardA,
			ForwardB => ForWardB,
			ForwardSW => ForWardSW
			
		);
	
	u12 : ALU
	port map(
			Asrc      	=> AMuxOut,
			Bsrc        => BMuxOut,
			ALUop		  	=> IdExALUOP,
			
			ALUresult  	=> ALUResult,
			branchJudge => BranchJudge
	);
	
	u13 : ExMemRegisters
	port map(
			clk => clk_3,
			rst => rst,
			flashFinished => flashFinished,
			
			rdIn => IdExRd,
			MFPCMuxIn => MFPCMuxOut,
			readData2In => WriteDataOut,
			
			regWriteIn => IdExRegWrite,
			memReadIn => IdExMemRead,
			memWriteIn => IdExMemWrite,
			memToRegIn => IdExMemToReg,
						
			rdOut => ExMemRd,
			ALUResultOut => ExMemALUResult,
			readData2Out => ExMemReadData2,
			
			regWriteOut => ExMemRegWrite,
			memReadOut => ExMemRead,
			memWriteOut => ExMemWrite,
			memToRegOut => ExMemToReg
		);
	
	u14 : MemWbRegisters
	port map(
			clk => clk_3,
			rst => rst,
			flashFinished => flashFinished,
			
			readMemDataIn => DMDataOut,
			ALUResultIn => ExMemALUResult,
			rdIn => ExMemRd,
			
			regWriteIn => ExMemRegWrite,
			memToRegIn => ExMemToReg,
			
			dataToWB => dataToWB,
			rdOut => rdToWB,
			regWriteOut => MemWbRegWrite
		);
	
	u15 : HazardDetectionUnit
	port map(
			IdExeWriteReg => IdExRd,
			IdExeMemRead => IdExMemRead,
			
			readReg1 => ReadReg1MuxOut,
			readReg2 => ReadReg2MuxOut,
			
			PCKeep => PCKeep,
			IfIdKeep_LW => IfIdKeep,
			IdExeFlush_LW => LW_IdExFlush
		);
		
	u16 : PCMux
	port map( 
			PCAddOne => PCAddOne,
			IdExPC => IdExPC,
			IdEximme => IdExImme,
			AsrcOut => AMuxOut,
			
			jump => IdExJump,
			BranchJudge => BranchJudge,
			PCRollback => PCRollback,
			
			PCOut => PCMuxOut
		);
	
	u17 : MemoryUnit
		port map( 
			clk => clk,
         rst => rst,
			
			data_ready => dataReady,
			tbre => tbre,
			tsre => tsre,
         wrn => wrn,
			rdn => rdn,
			  
			MemRead => ExMemRead,
			MemWrite => ExMemWrite,
			
			dataIn => ExMemReadData2,
			
			ramAddr => ExMemALUResult,
			PCOut => PCOut,
			PCMuxOut => PCMuxOut,
			PCKeep => PCKeep,
			dataOut => DMDataOut,
			insOut => IMInsOut,
			
			MemoryState => MemoryState,
			FlashStateOut => FlashStateOut,
			flashFinished => flashFinished,
			
			ram1_addr => ram1Addr,
			ram2_addr => ram2Addr,
			ram1_data => ram1Data,
			ram2_data => ram2Data,
			
			ram2AddrOutput => ram2AddrOutput,
			
			ram1_en => ram1En,
			ram1_oe => ram1Oe,
			ram1_we => ram1We,
			ram2_en => ram2En,
			ram2_oe => ram2Oe,
			ram2_we => ram2We,
			
			
			flash_addr => flashAddr,
			flash_data => flashData,
			
			flash_byte => flashByte,
			flash_vpen => flashVpen,
			flash_rp => flashRp,
			flash_ce => flashCe,
			flash_oe => flashOe,
			flash_we => flashWe
		);

	u18 : Clock
	port map(
		rst => rst,
		clk => clkIn_clock,
		
		clkout => clk,
		clk1 => clk_3,
		clk2 => clk_registers
	);
	
	
	u19 : StructConflictUnit
	port map(
			IdExeMemWrite => IdExMemWrite,
			ALUResult => ALUResult, 
			IfIdFlush_StructConflict => SW_IfIdflush,
			IdExeFlush_StructConflict => SW_IdExFlush,
			PCRollback => PCRollback
	);

	
	
	u20 : MFPCMux
	port map(
			PCAddOne => IdExPC,
			RawALUResult => ALUResult,
			isMFPC => IdExMFPC,
		
			RealALUResult => MFPCMuxOut
	);
	
	u21 : ReadReg1Mux
	port map(
			rx => rx,
			ry => ry,
			ReadReg1 => controllerOut(16 downto 14),
			
			ReadReg1Out => ReadReg1MuxOut
	);
	
	u22 : ReadReg2Mux
	port map(
			rx => rx,
			ry => ry,
			ReadReg2 => controllerOut(13),
			
			ReadReg2Out => ReadReg2MuxOut

	);
	
	u23 : VGA_Controller
	port map(
	--VGA Side
		hs => hs,
		vs => vs,
		oRed => redOut,
		oGreen => greenOut,
		oBlue	=> blueOut,
	--RAM side
--		R,G,B	: in  std_logic_vector (9 downto 0);
--		addr	: out std_logic_vector (18 downto 0);
	-- data
		r0 => r0,
		r1 => r1,
		r2 => r2,
		r3 => r3,
		r4 => r4,
		r5 => r5,
		r6 => r6,
		r7 => r7,
	--font rom
		romAddr => fontRomAddr,
		romData => fontRomdata,
	--pc
		PC => PCOut,
		CM => IMInsOut,
		Tdata => dataT,
		IHdata => dataIH,
		SPdata => dataSP,
	--Control Signals
		reset	=> rst,
		CLK_in => clk_50
	);		
	--r0 <= "0110101010010111";
	--r1 <= "1011100010100110";
--	u24 : digit
--	port map(
--			clkA => clk_50,
--			addra => digitRomAddr,
--			douta => digitRomData
--	);
	
	u25 : fontRom
	port map(
		clka => clk_50,
		addra => fontRomAddr,
		douta => fontRomData
		);
	
	u26 : MemWriteDataMux 
	port map(
			ForwardSW => ForwardSW,
			
			readData2 => IdExReadData2,
			ExeMemALUResult => ExMemALUResult,
			MemWbResult => dataToWB,
			
			WriteData => WriteDataOut
		);
	
	u27 : dcm
	port map( 
				 CLKIN_IN   => clk_50,
				 RST_IN     => always_zero,
				 CLKFX_OUT  => CLKFX_OUT,
				 CLK0_OUT   => CLK0_OUT,
				 CLK2X_OUT  => CLK2X_OUT,
				 LOCKED_OUT => LOCKED_OUT
		);
	
	
	
	process(flashData, MemoryState, FlashStateOut, RegisterState)
	--process(dataToWB, ForwardA, ForwardSW, rdToWB)
	--process(dataToWB, rdToWB, MemoryState, RegisterState)
	begin
		led(15 downto 14) <= RegisterState;
		led(13 downto 12) <= MemoryState;
		led(11 downto 9) <= FlashStateOut;
		--led(15 downto 14) <= ForwardA;
		--led(13 downto 12) <= ForwardSW;
		--led(11 downto 8) <= rdToWB;
		--led(7 downto 0) <= dataToWB(7 downto 0);
		
		led(8 downto 0) <= (others => '0');
		--led <= flashData;
	end process;
	
	--clk_chooser
	process(CLKFX_OUT, rst, clk_hand)
	begin
		if opt = '1' then
			if rst = '0' then
				clkIn_clock <= '0';
			else
				clkIn_clock <= clk_hand;
			end if;
		else
			if rst = '0' then
				clkIn_clock <= '0';
			else 
				clkIn_clock <= CLKFX_OUT;
			end if;
		end if;
	end process;
	
	
	--jing <= PCOut;
	process(ram2AddrOutput)
	begin
		case ram2AddrOutput(7 downto 4) is
			when "0000" => digit1 <= "0111111";--0
			when "0001" => digit1 <= "0000110";--1
			when "0010" => digit1 <= "1011011";--2
			when "0011" => digit1 <= "1001111";--3
			when "0100" => digit1 <= "1100110";--4
			when "0101" => digit1 <= "1101101";--5
			when "0110" => digit1 <= "1111101";--6
			when "0111" => digit1 <= "0000111";--7
			when "1000" => digit1 <= "1111111";--8
			when "1001" => digit1 <= "1101111";--9
			when "1010" => digit1 <= "1110111";--A
			when "1011" => digit1 <= "1111100";--B
			when "1100" => digit1 <= "0111001";--C
			when "1101" => digit1 <= "1011110";--D
			when "1110" => digit1 <= "1111001";--E
			when "1111" => digit1 <= "1110001";--F
			when others => digit1 <= "0000000";
		end case;
		
		case ram2AddrOutput(3 downto 0) is
			when "0000" => digit2 <= "0111111";--0
			when "0001" => digit2 <= "0000110";--1
			when "0010" => digit2 <= "1011011";--2
			when "0011" => digit2 <= "1001111";--3
			when "0100" => digit2 <= "1100110";--4
			when "0101" => digit2 <= "1101101";--5
			when "0110" => digit2 <= "1111101";--6
			when "0111" => digit2 <= "0000111";--7
			when "1000" => digit2 <= "1111111";--8
			when "1001" => digit2 <= "1101111";--9
			when "1010" => digit2 <= "1110111";--A
			when "1011" => digit2 <= "1111100";--B
			when "1100" => digit2 <= "0111001";--C
			when "1101" => digit2 <= "1011110";--D
			when "1110" => digit2 <= "1111001";--E
			when "1111" => digit2 <= "1110001";--F
			when others => digit2 <= "0000000";
		end case;
	end process;
	--ram1Addr <= (others => '0');
end Behavioral;


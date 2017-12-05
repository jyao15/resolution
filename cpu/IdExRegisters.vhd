----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:10:08 11/21/2016 
-- Design Name: 
-- Module Name:    IdExRegisters - Behavioral 
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

entity IdExRegisters is
	--ID/EX阶段寄存器
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
end IdExRegisters;

architecture Behavioral of IdExRegisters is

begin
	process(clk, rst) ---敏感信号要不要4个Flush信号？？？？？
	begin		
		if (rst = '0') then
			PCOut <= (others => '0');
			rdOut <= "1110";
			Reg1Out <= "1111";
			Reg2Out <= "1111";
			ALUSrcBOut <= '0';
			ReadData1Out <= (others => '0');
			ReadData2Out <= (others => '0');
			immeOut <= (others => '0');
			
			MFPCOut <= '0';
			regWriteOut <= '0';
			memWriteOut <= '0';
			memReadOut <= '0';
			memToRegOut <= '0';
			jumpOut <= '0';
			ALUOpOut <= "0000";
			
		elsif (clk'event and clk = '1') then
		if(flashFinished = '1') then
			if (LW_IdExFlush = '1' or Branch_IdExFlush = '1' or Jump_IdExFlush = '1' or SW_IdExFlush = '1') then
				
				PCOut <= (others => '0');
				rdOut <= "1110";
				Reg1Out <= "1111";
				Reg2Out <= "1111";
				ALUSrcBOut <= '0';
				ReadData1Out <= (others => '0');
				ReadData2Out <= (others => '0');
				immeOut <= (others => '0');
				
				MFPCOut <= '0';
				regWriteOut <= '0';
				memWriteOut <= '0';
				memReadOut <= '0';
				memToRegOut <= '0';
				jumpOut <= '0';
				ALUOpOut <= "0000";
				
			else
				
				PCOut <= PCIn;
				rdOut <= rdIn;
				Reg1Out <= Reg1In;
				Reg2Out <= Reg2In;
				ALUSrcBOut <= ALUSrcBIn;
				ReadData1Out <= ReadData1In;
				ReadData2Out <= ReadData2In;
				immeOut <= immeIn;
				
				MFPCOut <= MFPCIn;
				regWriteOut <= regWriteIn;
				memWriteOut <= memWriteIn;
				memReadOut <= memReadIn;
				memToRegOut <= memToRegIn;
				jumpOut <= jumpIn;
				ALUOpOut <= ALUOpIn;
			end if;
		end if;
		end if;
	end process;
end Behavioral;


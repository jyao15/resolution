----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:33:37 11/21/2016 
-- Design Name: 
-- Module Name:    MemWbRegisters - Behavioral 
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

entity MemWbRegisters is
	--MEM/WB阶段寄存器
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
end MemWbRegisters;

architecture Behavioral of MemWbRegisters is

begin
	process(rst, clk)
	begin
		if (rst = '0') then
			dataToWB <= (others => '0');
			rdOut <= "1110";
			regWriteOut <= '0';
		elsif (clk'event and clk = '1') then
		if(flashFinished = '1') then
			rdOut <= rdIn;
			regWriteOut <= regWriteIn;
			if (memToRegIn = '0') then
				dataToWB <= ALUResultIn;
			elsif (memToRegIn = '1') then
				dataToWB <= readMemDataIn;
			end if;
		end if;
		end if;
	end process;
end Behavioral;


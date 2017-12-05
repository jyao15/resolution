----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:10 11/22/2016 
-- Design Name: 
-- Module Name:    AMux - Behavioral 
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

entity AMux is
	port(
		--控制信号
		ForwardA : in std_logic_vector(1 downto 0);
		--供选择数据
		ReadData1 : in std_logic_vector(15 downto 0);
		ExMemALUResult : in std_logic_vector(15 downto 0);	--上条指令的ALU结果
		MemWbResult : in std_logic_vector(15 downto 0);	--上上条指令的结果
		--MemWbMemResult : in std_logic_vector(15 downto 0);	--上上条指令的读DM结果
		--选择结果输出
		AsrcOut : out std_logic_vector(15 downto 0)
	);
end AMux;

architecture Behavioral of AMux is

begin
	process(ForwardA,ReadData1,ExMemALUResult,MemWbResult)
	begin
		case ForwardA is
			when "00" =>
				AsrcOut <= ReadData1;
			when "01" =>
				AsrcOut <= ExMemALUResult;
			when "10" =>
				AsrcOut <= MemWbResult;
			when others =>
		end case;
	end process;
end Behavioral;


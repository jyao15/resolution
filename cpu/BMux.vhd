----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:18:15 11/22/2016 
-- Design Name: 
-- Module Name:    BMux - Behavioral 
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

entity BMux is
	port(
		--控制信号
		ForwardB : in std_logic_vector(1 downto 0);
		ALUSrcB  : in std_logic;
		--供选择数据
		ReadData2 : in std_logic_vector(15 downto 0);
		imme 	    : in std_logic_vector(15 downto 0);
		ExMemALUResult : in std_logic_vector(15 downto 0);	--上条指令的ALU结果
		MemWbResult : in std_logic_vector(15 downto 0);	--上上条指令的ALU结果
		--MemWbMemResult : in std_logic_vector(15 downto 0);	--上上条指令的读DM结果
		--选择结果输出
		BsrcOut : out std_logic_vector(15 downto 0)
	);	
end BMux;

architecture Behavioral of BMux is
	
begin
	process(ForwardB, ALUSrcB, ReadData2, imme, ExMemALUResult, MemWbResult)
	begin 
		case ForwardB is
			when "00" =>
				case ALUSrcB is
					when '0' =>
						BsrcOut <= ReadData2;
					when '1' =>
						BsrcOut <= imme;
					when others =>
				end case;
				
			when "01" =>
				BsrcOut <= ExMemALUResult;
			when "10" =>
				BsrcOut <= MemWbResult;
			when others => --error
		end case;

	end process;

end Behavioral;


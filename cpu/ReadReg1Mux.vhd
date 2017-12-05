----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:38 11/21/2016 
-- Design Name: 
-- Module Name:    ReadReg1Mux - Behavioral 
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

entity ReadReg1Mux is
	--源寄存器1选择器
	port(
		rx : in std_logic_vector(2 downto 0);
		ry : in std_logic_vector(2 downto 0);				--R0~R7中的一个
		
		ReadReg1 : in std_logic_vector(2 downto 0);		--由总控制器Controller生成的控制信号
		
		ReadReg1Out : out std_logic_vector(3 downto 0)  --"0XXX"代表R0~R7，"1000"=SP,"1001"=IH, "1010"=T, "1111"=没有
	);
end ReadReg1Mux;

architecture Behavioral of ReadReg1Mux is

begin
	process(rx, ry, ReadReg1)
	begin
		case ReadReg1 is
			when "001" =>		--rx
				ReadReg1Out <= '0' & rx;
			when "010" =>		--ry
				ReadReg1Out <= '0' & ry;
			when "011" =>		--T
				ReadReg1Out <= "1010";
			when "100" =>		--SP
				ReadReg1Out <= "1000";
			when "101" =>		--IH
				ReadReg1Out <= "1001";
			when others =>		--No ReadReg1（不需要寄存器1）
				ReadReg1Out <= "1111";
		end case;
	end process;
end Behavioral;


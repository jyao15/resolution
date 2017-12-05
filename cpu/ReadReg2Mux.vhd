----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:03:40 11/21/2016 
-- Design Name: 
-- Module Name:    ReadReg2Mux - Behavioral 
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

entity ReadReg2Mux is
	--源寄存器2选择器
	port(
		rx : in std_logic_vector(2 downto 0);
		ry : in std_logic_vector(2 downto 0);			--R0~R7中的一个
		
		ReadReg2 : in std_logic;							--由总控制器Controller生成的控制信号
		
		ReadReg2Out : out std_logic_vector(3 downto 0)  --"0XXX"代表R0~R7, "1111"=没有
	);
end ReadReg2Mux;

architecture Behavioral of ReadReg2Mux is

begin
	process(rx, ry, ReadReg2)
	begin
		case ReadReg2 is
			when '0' =>			--rx
				ReadReg2Out <= '0' & rx;
			when '1' =>			--ry
				ReadReg2Out <= '0' & ry;
			when others =>		--No ReadReg2（不需要源寄存器2）
				ReadReg2Out <= "1111";
		end case;
	end process;
end Behavioral;


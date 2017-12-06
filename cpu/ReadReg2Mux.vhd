----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:57:44 11/27/2017 
-- Design Name: 
-- Module Name:    ReadReg2MUX - Behavioral 
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
	port(
			ten_downto_eight : in std_logic_vector(2 downto 0);
			seven_downto_five : in std_logic_vector(2 downto 0);
			
			ReadReg2 : in std_logic_vector(1 downto 0);
			
			ReadReg2Out : out std_logic_vector(3 downto 0)  --"0XXX"代表R0~R7，"1111"=没有
		);
end ReadReg2Mux;

architecture Behavioral of ReadReg2Mux is

begin
	process(ten_downto_eight,seven_downto_five,ReadReg2)
	begin
		case ReadReg2 is
			when "10" =>		--(10,8)
				ReadReg2Out <= '0' & ten_downto_eight;
			when "11" =>		--(7,5)
				ReadReg2Out <= '0' & seven_downto_five;
			when others =>		--No ReadReg2
				ReadReg2Out <= "1111";
		end case;
	end process;

end Behavioral;


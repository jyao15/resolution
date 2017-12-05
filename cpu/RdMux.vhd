----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:59:09 11/22/2016 
-- Design Name: 
-- Module Name:    RdMux - Behavioral 
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

entity RdMux is
	port(
		rx : in std_logic_vector(2 downto 0);
		ry : in std_logic_vector(2 downto 0);
		rz : in std_logic_vector(2 downto 0);		--R0~R7中的一�
			
		RegDst : in std_logic_vector(2 downto 0);	--由总控制器Controller生成的控制信�
			
		rdOut : out std_logic_vector(3 downto 0)	--"0XXX"代表R0~R7�1000"=SP,"1001"=IH, "1010"=T, "1110"=没有
	);
end RdMux;

architecture Behavioral of RdMux is

begin

	process(rx, ry, rz, RegDst)
	begin
		case RegDst is
			when "001" =>--rx
				rdOut <= '0' & rx;
			when "010" =>--ry
				rdOut <= '0' & ry;
			when "011" =>--rz
				rdOut <= '0' & rz;
			when "100" =>--T
				rdOut <= "1010";
			when "101" =>--SP
				rdOut <= "1000";
			when "110" =>--IH
				rdOut <= "1001";
			
			when others =>
				rdOut <= "1110";
		end case;
	end process;
end Behavioral;


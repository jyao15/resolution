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

entity HazardDetectionUnit is
	port(
		IdExRd : in std_logic_vector(3 downto 0);
		IdExMemRead : in std_logic;
		
		ReadReg1 : in std_logic_vector(3 downto 0);
		ReadReg2 : in std_logic_vector(3 downto 0);
		
		PCKeep : out std_logic;
		IfIdKeep : out std_logic;
		IdExFlush : out std_logic
	);	
end HazardDetectionUnit;

architecture Behavioral of HazardDetectionUnit is
	
begin
	process(IdExRd, IdExMemRead, ReadReg1, ReadReg2)
	begin 
		if (IdExMemRead = '0') then
			PCKeep <= '0';
			IfIdKeep <= '0';
			IdExFlush <= '0';
		elsif (ReadReg1 = "1111" and ReadReg2 = "1111") then
			PCKeep <= '0';
			IfIdKeep <= '0';
			IdExFlush <= '0';
		elsif (ReadReg1 = IdExRd or ReadReg2 = IdExRd) then
			PCKeep <= '1';
			IfIdKeep <= '1';
			IdExFlush <= '1';
		else
			PCKeep <= '0';
			IfIdKeep <= '0';
			IdExFlush <= '0';
		end if;

	end process;

end Behavioral;


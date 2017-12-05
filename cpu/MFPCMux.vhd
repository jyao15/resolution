----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:29:37 11/20/2016 
-- Design Name: 
-- Module Name:    MFPCMux - Behavioral 
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

entity MFPCMux is
	--（MFPC指令）从PC+1和ALUResult中选择一个作为“真正的ALUResult”
	port(
		PCAddOne  : in std_logic_vector(15 downto 0);	
		ALUResult : in std_logic_vector(15 downto 0);
		MFPC		 : in std_logic;		--MFPC = '1'的时候选择PC+1的值
		
		MFPCMuxOut : out std_logic_vector(15 downto 0)
	);
end MFPCMux;

architecture Behavioral of MFPCMux is

begin
	process(PCAddOne, ALUResult, MFPC)
	begin
		if (MFPC = '1') then
			MFPCMuxOut <= PCAddOne;
		elsif (MFPC = '0') then
			MFPCMuxOut <= ALUResult;
		end if;
		
	end process;
end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:38:21 11/22/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
	port(
		Asrc       :  in STD_LOGIC_VECTOR(15 downto 0);
		Bsrc       :  in STD_LOGIC_VECTOR(15 downto 0);
		ALUop		  :  in STD_LOGIC_VECTOR(3 downto 0);
		ALUresult  :  out STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000"; -- 默认设为全0
		branchJudge : out std_logic
	);
end ALU;

architecture Behavioral of ALU is
	shared variable tmp : std_logic_vector(15 downto 0);
	shared variable zero : std_logic_vector(15 downto 0) := "0000000000000000";
begin
	process(Asrc , Bsrc , ALUop)
	begin
		case ALUop is 
			when "0001" => --  +
				ALUresult <= Asrc + Bsrc;
				branchJudge <= '0';
			when "0010" => --  -
				ALUresult <= Asrc - Bsrc; -- A-B
				branchJudge <= '0';
			when "0011" => --  AND
				ALUresult <= Asrc and Bsrc;
				branchJudge <= '0';
			when "0100" => --  OR
				ALUresult <= Asrc or Bsrc;
				branchJudge <= '0';
			when "0101" => -- NEG
				ALUresult <= zero - Asrc;
				branchJudge <= '0';
			when "0110" => --SLL
				tmp := Asrc(15 downto 0);
				if (Bsrc = zero) then 
					ALUresult(15 downto 0) <= to_stdlogicvector(to_bitvector(tmp) sll 8);--left 8
				else 
					ALUresult <= to_stdlogicvector(to_bitvector(Asrc) sll conv_integer(Bsrc));
				end if;
				branchJudge <= '0';
			when "1100" => --SLLV
				ALUresult <= to_stdlogicvector(to_bitvector(Asrc) sll conv_integer(Bsrc));
				branchJudge <= '0';
			when "0111" => --  SRA
				tmp := Asrc(15 downto 0);
				if (Bsrc = zero) then 
					ALUresult(15 downto 0) <= to_stdlogicvector(to_bitvector(tmp) sra 8);--left 8
				else 
					ALUresult <= to_stdlogicvector(to_bitvector(Asrc) sra conv_integer(Bsrc));
				end if;
				branchJudge <= '0';
			when "1101" => --SRAV
				ALUresult <= to_stdlogicvector(to_bitvector(Asrc) sra conv_integer(Bsrc));
				branchJudge <= '0';
			when "1000" => -- cmp , cmpi
				if (Asrc = Bsrc) then 
					ALUresult <= "0000000000000000";
				else 
					ALUresult <= "0000000000000001";
				end if;
				branchJudge <= '0';
			when "1001" => --BEQZ, BTEQZ
				--ALUresult  <= Asrc - Bsrc; 
				if (Asrc = zero) then
					branchJudge <= '1';
				else 
					branchJudge <= '0';
				end if;
			when "1010" => --B
				branchJudge <= '1';
			when "1011" => --BNEZ
				--ALUresult  <= Asrc - Bsrc; 
				if (Asrc = zero) then
					branchJudge <= '0';
				else 
					branchJudge <= '1';
				end if;
			when "1110" => --Asrc
				ALUresult <= Asrc;
			when "1111" => --Bsrc
				ALUresult <= Bsrc;
				
			when others => ALUresult <= "0000000000000000";
				branchJudge <= '0';
		end case;
	end process;

end Behavioral;


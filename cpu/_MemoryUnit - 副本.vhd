----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:26:00 11/22/2016 
-- Design Name: 
-- Module Name:    MemoryUnit - Behavioral 
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

entity MemoryUnit is
	port(
		--时钟
		clk : in std_logic;
		rst : in std_logic;
		
		--串口
		data_ready : in std_logic;		--数据准备信号，='1'表示串口的数据已准备好（读串口成功，可显示读到的data）
		tbre : in std_logic;				--发送数据标志
		tsre : in std_logic;				--数据发送完毕标志，tsre and tbre = '1'时写串口完毕
		wrn : out std_logic;				--写串口，初始化为'1'，先置为'0'并把RAM1data赋好，再置为'1'写串口
		rdn : out std_logic;				--读串口，初始化为'1'并将RAM1data赋为"ZZ..Z"，
												--若data_ready='1'，则把rdn置为'0'即可读串口（读出数据在RAM1data上）
		
		--RAM1（DM）和RAM2（IM）
		MemRead : in std_logic;			--控制读DM的信号，='1'代表需要读
		MemWrite : in std_logic;		--控制写DM的信号，='1'代表需要写
		
		dataIn : in std_logic_vector(15 downto 0);		--写内存时，要写入DM或IM的数据
		
		ramAddr : in std_logic_vector(15 downto 0);		--读DM/写DM/写IM时，地址输入
		PC : in std_logic_vector(15 downto 0);				--读IM时，地址输入
		dataOut : out std_logic_vector(15 downto 0);		--读DM时，读出来的数据/读出的串口状态
		insOut : out std_logic_vector(15 downto 0);		--读IM时，出来的指令
		
		ram1_addr : out std_logic_vector(17 downto 0); 	--RAM1地址总线
		ram2_addr : out std_logic_vector(17 downto 0); 	--RAM2地址总线
		ram1_data : inout std_logic_vector(15 downto 0);--RAM1数据总线
		ram2_data : inout std_logic_vector(15 downto 0);--RAM2数据总线
		
		ram1_en : out std_logic;		--RAM1使能，='1'禁止
		ram1_oe : out std_logic;		--RAM1读使能，='1'禁止；
		ram1_we : out std_logic;		--RAM1写使能，='1'禁止
		ram2_en : out std_logic;		--RAM2使能，='1'禁止
		ram2_oe : out std_logic;		--RAM2读使能，='1'禁止
		ram2_we : out std_logic			--RAM2写使能，='1'禁止
		
		
	);
end MemoryUnit;

architecture Behavioral of MemoryUnit is
	signal state : std_logic_vector(1 downto 0) := "00";
	
begin

	--ram1_addr(17 downto 16) <= "00";
	--ram2_addr(17 downto 16) <= "00";

	process(clk, rst)
	begin
		if rst = '0' then
			ram1_en <= '1';
			ram1_oe <= '1';
			ram1_we <= '1';
			ram2_en <= '1';
			ram2_oe <= '1';
			ram2_we <= '1';
			wrn <= '1';
			rdn <= '1';
			
			ram1_addr <= (others => '0');
			ram2_addr <= (others => '0');
			dataOut <= (others => '0');
			insOut <= (others => '0');
			
			state <= "00";
			
		elsif clk'event and clk = '1' then 
			ram1_en <= '0';
			ram2_en <= '0';
			
			case state is 
				when "00" =>
					if (MemWrite = '1') then --写内存或串口
						if (ramAddr <= x"7FFF" and ramAddr >= x"4000") then	--写指令内存
							ram2_data <= dataIn;
							ram2_addr(15 downto 0) <= ramAddr;
							ram2_we <= '0';
							ram2_oe <= '1';--禁止--
							wrn <= '1';		--禁止--
							rdn <= '1';		--禁止--
						elsif (ramAddr = x"BF00") then	--写串口数据
							ram1_data(7 downto 0) <= dataIn(7 downto 0);
							ram1_addr(15 downto 0) <= ramAddr;
							wrn <= '0';
							rdn <= '1';		--禁止--
							ram1_we <= '1';--禁止--
							ram1_oe <= '1';--禁止--
							ram2_we <= '1';--禁止--
							ram2_oe <= '1';--禁止--
						else										--写数据内存
							ram1_data <= dataIn;
							ram1_addr(15 downto 0) <= ramAddr;
							ram1_we <= '0';
							ram1_oe <= '1';--禁止--
							wrn <= '1';		--禁止--
							rdn <= '1';		--禁止--
						end if;
					elsif (MemRead = '1') then --读数据内存或串口
						if (ramAddr <= x"BF00") then		--读串口数据
							ram1_data(7 downto 0) <= "ZZZZZZZZ";
							rdn <= '1';
							wrn <= '1';		--禁止--
							ram1_we <= '1';--禁止--
							ram1_oe <= '1';--禁止--
							ram2_we <= '1';--禁止--
							ram2_oe <= '1';--禁止--
						elsif (ramAddr <= x"BF01") then	--读串口状态
							dataOut(15 downto 2) <= (others => '0');
							dataOut(1) <= data_ready;
							dataOut(0) <= tsre and tbre;
						else										--读数据内存
							ram1_data <= (others => 'Z');
							ram1_addr(15 downto 0) <= ramAddr;
							ram1_oe <= '0';
							ram1_we <= '1';--禁止--
							wrn <= '1';		--禁止--
							rdn <= '1';		--禁止--
						end if;
					end if;
					state <= "01";
				when "01" =>
					if (MemWrite = '1') then --写内存或串口
						if (ramAddr <= x"7FFF" and ramAddr >= x"4000") then	--写指令内存
							ram2_we <= '1';			--第二步，拉高RAM2写信号
							ram2_oe <= '1';--禁止--
							wrn <= '1';		--禁止--
							rdn <= '1';		--禁止--
						elsif (ramAddr = x"BF00") then	--写串口数据
							wrn <= '1';					--第二步，拉高写串口信号
							rdn <= '1';		--禁止--
							ram1_we <= '1';--禁止--
							ram1_oe <= '1';--禁止--
							ram2_we <= '1';--禁止--
							ram2_oe <= '1';--禁止--
						else										--写数据内存
							ram1_we <= '1';			--第二步，拉高RAM1写信号
							ram1_oe <= '1';--禁止--
							wrn <= '1';		--禁止--
							rdn <= '1';		--禁止--
						end if;
					elsif (MemRead = '1') then --读数据内存或串口
						if (ramAddr <= x"BF00") then		--读串口数据
							if (data_ready = '1') then
								rdn <= '0';
								dataOut(7 downto 0) <= ram1_data(7 downto 0);	--------写在一个状态里？？
								dataOut(15 downto 8) <= "00000000";		--输出数据的高八位清零
							end if;
							wrn <= '1';		--禁止--
							ram1_we <= '1';--禁止--
							ram1_oe <= '1';--禁止--
							ram2_we <= '1';--禁止--
							ram2_oe <= '1';--禁止--
						elsif (ramAddr <= x"BF01") then	--读串口状态
							null;
						else										--读数据内存
							dataOut <= ram1_data;							-------这里可以直接得到数据吗？
							ram1_we <= '1';--禁止--
							wrn <= '1';		--禁止--
							rdn <= '1';		--禁止--
						end if;
					end if;
					state <= "10";
				when "10" =>		--读指令内存
					ram2_data <= (others => 'Z');
					ram2_addr(15 downto 0) <= PC;
					ram2_oe <= '0';
					ram2_we <= '1';		--禁止--
					
					state <= "11";
				when "11" =>		--读指令内存，第二阶段
					insOut <= ram2_data;							-------这里可以直接得到数据吗？
					ram2_we <= '1';		--禁止--
					
					state <= "00";
					
				when others =>
					state <= "00";
					
			end case;
		end if;
	end process;
end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:28:47 12/01/2016 
-- Design Name: 
-- Module Name:    clockdivider - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clockdivider is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           nclock : out  STD_LOGIC);
end clockdivider;

architecture Behavioral of clockdivider is
signal outclok:STD_LOGIC :='0';


begin
process(clock,reset)

variable count : INTEGER := 0;
begin 
	if(reset = '1') then
		count:=0;
		outclok <='0';
	else	
		if (rising_edge(clock) ) then
			if (count = 512) then --change the 5 into 511 please :') 
			count:= 0;
			outclok <= not outclok;
			else 
				count := count + 1;
			end if;
		end if;
	end if;
end process;

nclock <=outclok;
end Behavioral;


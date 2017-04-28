----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:37:46 04/24/2017 
-- Design Name: 
-- Module Name:    stateEncoder - Structural 
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
-- 0 NULL , 1 hyphen , 2->6 A->E, 7->I,8->V
entity stateEncoder is
    Port ( cheat : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           state : in  STD_LOGIC_VECTOR (2 downto 0);
           choice : out   integer range 0 to 9);
end stateEncoder;

architecture Behavioral of stateEncoder is

begin
process(clock) 
begin
if(rising_edge(clock))then
	if(cheat ='0') then
		choice <= 1;
	else
		choice<= conv_integer(unsigned(state))+2;
end if;
end if;
end process;
end Behavioral;


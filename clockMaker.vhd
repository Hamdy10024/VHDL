----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:25:22 03/27/2017 
-- Design Name: 
-- Module Name:    clockMaker - Behavioral 
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

entity clockMaker is
    Port ( rise : in  STD_LOGIC;
           fall : in  STD_LOGIC;
           clock : out  STD_LOGIC);
end clockMaker;

architecture Behavioral of clockMaker is

begin
signal clok : STD_LOGIC:='0';
process(rise,fall)
if(rise = '1') then
clok<='1';
elsif ( fall = '1') then
clok <='0';
end if;
end process;
clock <= clok;
end Behavioral;


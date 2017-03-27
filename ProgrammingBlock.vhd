----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:29:18 03/27/2017 
-- Design Name: 
-- Module Name:    ProgrammingBlock - Behavioral 
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

entity ProgrammingBlock is
    Port ( clock : in  STD_LOGIC;
           Digit : in  STD_LOGIC_VECTOR (2 downto 0);
           slct : in  STD_LOGIC;
			  Digit1: out Integer range 0  to 7;
			  Digit2: out Integer range 0  to 7;
			  Digit3: out Integer range 0  to 7;
			  dispCode : out Integer range 0 to 7); --specific integer to use in 7 seg 
end ProgrammingBlock;

architecture Behavioral of ProgrammingBlock is

begin


end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:35:33 03/27/2017 
-- Design Name: 
-- Module Name:    OperationBlock - Behavioral 
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

entity OperationBlock is
    Port ( slct : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           digit : in  STD_LOGIC_VECTOR (2 downto 0)  ;
			  Digit1: in Integer range 0  to 7;
			  Digit2: in Integer range 0  to 7;
			  Digit3: in Integer range 0  to 7;
			  dispCode : out Integer range 0 to 7); --specific integer to use in 7 seg 
end OperationBlock;

architecture Behavioral of OperationBlock is

begin


end Behavioral;


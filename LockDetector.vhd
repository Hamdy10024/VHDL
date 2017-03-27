----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:24:03 03/27/2017 
-- Design Name: 
-- Module Name:    LockDetector - Behavioral 
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

entity LockDetector is
    Port ( Mode : in  STD_LOGIC;
           Digits : in  STD_LOGIC_VECTOR (2 downto 0);
           rise : in  STD_LOGIC;
           fall : in  STD_LOGIC;
           segm : out  STD_LOGIC_VECTOR (7 downto 0);
           enabes : out  STD_LOGIC_VECTOR (3 downto 0));
end LockDetector;

architecture Behavioral of LockDetector is
 component clockMaker Port ( rise : in  STD_LOGIC;
           fall : in  STD_LOGIC;
           clock : out  STD_LOGIC);
end component;

 component  ProgrammingBlock is
    Port ( clock : in  STD_LOGIC;
           Digit : in  STD_LOGIC_VECTOR (2 downto 0);
           slct : in  STD_LOGIC;
			  Digit1: out Integer range 0  to 7;
			  Digit2: out Integer range 0  to 7;
			  Digit3: out Integer range 0  to 7;
			  dispCode : out Integer range 0 to 6); --specific integer to use in 7 seg
end component;
signal clock STD_LOGIC:='0';
begin


end Behavioral;


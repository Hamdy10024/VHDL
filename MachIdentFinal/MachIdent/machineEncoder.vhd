----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:59:02 04/24/2017 
-- Design Name: 
-- Module Name:    machineEncoder - Behavioral 
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
entity machineEncoder is
    Port ( clock : in  STD_LOGIC;
           mach : in  STD_LOGIC_VECTOR (2 downto 0);
           digit0 : out   integer range 0 to 9;
			  digit1 : out   integer range 0 to 9;
			  digit2 : out   integer range 0 to 9);
end machineEncoder;

architecture Behavioral of machineEncoder is
signal d00 :integer range 0 to 9 :=0;
signal d11 :integer range 0 to 9 :=0;
signal d22 :integer range 0 to 9 := 0;
begin
process(clock)
begin
	if(rising_edge(clock)) then
		if((mach = "000") or (mach = "001") or (mach = "010")) then
		d00 <= 7;
		elsif((mach = "011") or (mach = "110") ) then
		d00 <= 8;
		else
		d00<=0;
		end if;
		if((mach = "010") or (mach = "011") or (mach = "110")or (mach = "001") ) then
		d11 <= 7;
		else
		d11<=0;
		end if;
		if((mach = "010") ) then
		d22 <= 7;
		else
		d22<=0;
		end if;
	end if;
end process;
digit0 <= d00;
digit1 <= d11;
digit2 <= d22;
end Behavioral;


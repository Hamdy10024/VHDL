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
port (
    clk : in std_logic;
	slct : in std_logic;
	input : in std_logic_vector(2 downto 0);
    Digit1 : in integer range 0 to 7;
	Digit2 : in integer range 0 to 7;
	Digit3 : in integer range 0 to 7;
	dispCode : out integer range 0 to 7 -- 5 >> LOCK , 6 >> ERR , 7 >> OPEN
);
end OperationBlock;

architecture Behavioral of OperationBlock is
-- signals
signal message : integer range 0 to 9 := 0; -- initial state : LOCK
begin

	
process (clk,slct)
	-- variables
	
variable state : integer range 0 to 10 := 0;	
	begin
		if (clk'event and clk = '1' and slct = '1') then
			if (state = 0) then -- initial state
				message <= 5;
				if (conv_integer(unsigned(input)) = Digit1) then
					state := 1;
				else
					state := 2;
				end if;
			elsif (state = 1) then -- enterd matching 1st digit
				message <= 5;
				if (conv_integer(unsigned(input)) = Digit2) then
					state := 3;
				else
					state := 4;
				end if;
			elsif (state = 2) then -- enterd non-matching 1st digit
				message <= 5;
				state := 4;
			elsif (state = 3) then -- enterd matching 2nd digit
				message <= 5;
				if (conv_integer(unsigned(input)) = Digit3) then
					state := 5;
				else
					state := 6;
				end if;
			elsif (state = 4) then -- enterd non-matching 2nd or earlier digit
				message <= 5;
				state := 6;
			elsif (state = 5) then -- enterd matching 3rd digit
				message <= 7;
				state := 0;
			elsif (state = 6) then -- enterd non-matching 3rd or earlier digit
				message <= 6;
				if (conv_integer(unsigned(input)) = Digit1) then
					state := 1;
				else
					state := 2;
				end if;
			end if;	
		elsif (slct = '0') then
			state:=0;
			message <= 0;
		end if;
	end process;
	dispCode <= message;
end Behavioral;

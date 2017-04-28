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
  PORT (
  clk : IN std_logic;
  mode: IN std_logic;
  input : IN std_logic_vector (2 downto 0); 
  lcdflag : OUT integer  range 0 to 7;
  firstNum : OUT Integer range 0 to 7 := 0;
  secondNum : OUT Integer range 0 to 7 := 0;
  thirdNum : OUT Integer range 0 to 7:=0);
end ProgrammingBlock;

architecture Behavioral of ProgrammingBlock is

Signal currentState : integer range 0 to 9 :=0;
Signal first : integer range 0 to 7 :=0;
Signal second : integer range 0 to 7 :=0;
Signal third : integer range 0 to 7 :=0;
signal lcd : integer range 0 to 9 :=1;
begin
--  process(mode)
--  begin 
--  if (mode = '0' ) then 
--				currentState <= 0;
--				lcd <= 1;
--	end if;
-- end process;
 
  process (clk,mode)
  variable x1 : integer range 0 to 7;
  variable x2 : integer range 0 to 7;
  variable x3 : integer range 0 to 7;
  variable xn1 : integer range 0 to 7;
  variable xn2 : integer range 0 to 7;
  variable xn3 : integer range 0 to 7;  

   begin
	  if (mode = '0' ) then 
				currentState <= 0;
				lcd <= 1;
	 else
	 if (clk'event AND clk = '1') then
		 -- nothing to be displayed
     -- if (mode = '1') then  
			 if (currentState = 0) then 
			    x1 := conv_integer(unsigned(input));
			    currentState <= 1;
			 elsif(currentState = 1) then
			    x2 := conv_integer(unsigned(input));
				 currentState <=2;
			 elsif (currentState = 2) then
			    x3 := conv_integer(unsigned(input));
				 if (first = x1 AND second = x2 AND third=x3) then
					currentState <=3;
					lcd<= 2;
				else
					currentState<=0;
				end if;
			 elsif(currentState = 3) then
			   x1 := conv_integer(unsigned(input));
				currentState<=4;
			 elsif(currentState = 4) then
			   x2 := conv_integer(unsigned(input));
				currentState<=5;
			elsif(currentState = 5) then
			   x3 := conv_integer(unsigned(input));
				currentState<=6;
				lcd <= 3;
			 elsif (currentState = 6) then
			   xn1 := conv_integer(unsigned(input));
				currentState<=7;
			elsif(currentState = 7) then
			   xn2 := conv_integer(unsigned(input));
				currentState<=8;
			 elsif(currentState = 8) then
				xn3 := conv_integer(unsigned(input));
				if (x1 = xn1 AND x2 = xn2 AND x3 = xn3) then 
				  lcd <= 4;
				  first <= x1;
				  second <= x2;
				  third <= x3;
				  currentState<= 9;
				else 
				   lcd<=1;
					currentState<= 0;
				end if;
			 end if;
			 
	   end if;
	  end if;
   end process;
	lcdflag <= lcd;
	firstNum <= first;
	secondNum <= second;
	thirdNum <= third;
end Behavioral;

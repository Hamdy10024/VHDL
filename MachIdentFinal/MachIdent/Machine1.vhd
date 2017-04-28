----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:29:18 04/24/2017 
-- Design Name: 
-- Module Name:    Machine1 - Behavioral 
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

entity Machine1 is
  PORT (
  clk : IN std_logic;
  input: IN std_logic;
  output : OUT std_logic ; 
  state : out std_logic_vector (1 downto 0));
end Machine1;

architecture Behavioral of Machine1 is

constant A : std_logic_vector(1 downto 0) := "00";
constant B : std_logic_vector(1 downto 0) := "01";
constant c : std_logic_vector(1 downto 0) := "10";
constant D : std_logic_vector(1 downto 0) := "11";

Signal currentState : std_logic_vector (1 downto 0 ) := A;
Signal outputS : std_logic := '0';
begin
 
  process (clk)
   begin
	 if (clk'event AND clk = '1') then
	
			 if (currentState = A) then 
			    if ( input = '0' ) then
				 currentState <= B;
				 outputS <= '0';
				 else
				 currentState <= C;
				 outputS <= '1';
				 end if;
			 elsif(currentState = B) then
           if ( input = '0' ) then
			    currentState <= C;
				 outputS <= '1';
				 else
				 currentState <= D;
				 outputS <= '0';
				 end if;
			 elsif (currentState = C) then
			   if ( input = '0' ) then
			    currentState <= A;
				 outputS <= '0';
				 else
				 currentState <= D;
				 outputS <= '1';
				 end if;
			else
				 if ( input = '0' ) then
			    currentState <= B;
				 outputS <= '0';
				 else
				 currentState <= C;
				 outputS <= '0';
				 end if;
			end if;
	  end if;

   end process;
	state <= currentState;
	output <= outputS;
end Behavioral;

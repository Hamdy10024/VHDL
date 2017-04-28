----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:45:24 04/24/2017 
-- Design Name: 
-- Module Name:    Machine3 - Behavioral 
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

entity Machine3 is
 PORT (
  clk : IN std_logic;
  input: IN std_logic;
  output : OUT std_logic ;
  state : out std_logic_vector (2 downto 0));
end Machine3;
 
architecture Behavioral of Machine3 is
 
constant A : std_logic_vector(2 downto 0) := "000";
constant B : std_logic_vector(2 downto 0) := "001";
constant C : std_logic_vector(2 downto 0) := "010";
constant D : std_logic_vector(2 downto 0) := "011";
constant E : std_logic_vector(2 downto 0) := "100";
 
Signal currentState : std_logic_vector (2 downto 0) := A;
Signal outputS : std_logic := '1';
begin
 
  process (clk)
  begin
     if (clk'event AND clk = '1') then
             if (currentState = A) then
                if(input='0') then
                        currentState <= C;
                         outputS<='1';
                     else
                        currentState <= B;
                         outputS<='0';
                     end if;
             elsif(currentState = B) then
                if(input='0') then
                        currentState <= D;
                         outputS<='0';
                     else
                        currentState <= A;
                         outputS<='1';
                     end if;
             elsif (currentState = C) then
                    if(input='0') then
                        currentState <= E;
                         outputS<='0';
                     else
                        currentState <= C;
                         outputS<='0';
                     end if;
                 
                 elsif (currentState = D) then
                    if(input='0') then
                        currentState <= C;
                         outputS<='1';
                     else
                        currentState <= E;
                         outputS<='0';
                     end if;
             
            else
                if(input='0') then
                        currentState <= B;
                         outputS<='1';
                     else
                        currentState <= D;
                         outputS<='1';
                     end if;
            end if;
      end if;
   end process;
    state <= currentState;
    output <= outputS;
end Behavioral;

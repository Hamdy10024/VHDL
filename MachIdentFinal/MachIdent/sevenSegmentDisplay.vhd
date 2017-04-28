----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:22:57 03/15/2017 
-- Design Name: 
-- Module Name:    sevSeg - Behavioral 
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

entity sevSeg is
port (
  clk : in std_logic;
	d0 : in integer range 0 to 9;
	d1 : in integer range 0 to 9;
	d2 : in integer range 0 to 9;
	d3 : in integer range 0 to 9;
   enables : out std_logic_vector(3 downto 0);
   --decpoint : out std_logic ;
	sevenSeg : out std_logic_vector(7 downto 0)
	
);
end sevSeg;

architecture Behavioral of sevSeg is

constant NUL : std_logic_vector(7 downto 0) := "11111111";
constant HYPH : std_logic_vector(7 downto 0) := "11111101";
constant A : std_logic_vector(7 downto 0) := "00010001";
constant B : std_logic_vector(7 downto 0) := "11000001";
constant C : std_logic_vector(7 downto 0) := "01100011";
constant D : std_logic_vector(7 downto 0) := "10000101";
constant E : std_logic_vector(7 downto 0) := "01100001";
constant I : std_logic_vector(7 downto 0) := "10011111";
constant v : std_logic_vector(7 downto 0) := "11000111";
constant NINE : std_logic_vector(7 downto 0) := "00001001";
--signal  dpoint : std_logic := '1';
signal sigenable : std_logic_vector(3 downto 0) :="1111";
signal sigsevenSeg : std_logic_vector(7 downto 0) :="11111111";

type consts is array ( 9 downto 0) of STD_LOGIC_VECTOR(7 downto 0);

-- 0 NULL , 1 hyphen , 2->6 A->E, 7->I,8->V
signal cons : consts := (NINE,V,I,E,D,C,B,A,HYPH,NUl);
begin  
--  
	process (clk)
	variable x: INTEGER Range 0 to 3:=0;
  begin
		
		if (rising_edge(clk)) then
				if(x= 0) then
				sigsevenseg <=  cons(d0);
				sigenable<="1110";
				elsif(x= 1) then
				sigsevenseg <=  cons(d1);
				sigenable<="1101";
				elsif(x= 2) then
				sigsevenseg <=  cons(d2);
				sigenable<="1011";
				else
				sigsevenseg <= cons(d3);
				sigenable<="0111";
				end if;
				if(x=3) then 
				x := 0;
				else
				
					x:=x+1;
				end if;
					
		end if;
	end process;
	enables <= sigenable;
	sevenseg <= sigsevenseg;
	--decpoint <= '0';
end Behavioral;




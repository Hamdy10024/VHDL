----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:58:53 04/24/2017 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

entity Decoder is
    Port ( inp : in  STD_LOGIC_VECTOR (2 downto 0);
           enable : in  STD_LOGIC;
           outp : out  STD_LOGIC_VECTOR (7 downto 0));
end Decoder;

architecture Structural of Decoder is
signal x :STD_LOGIC:='0';
signal y :STD_LOGIC:='0';
signal z :STD_LOGIC:='0';
begin
x <= inp(2);
y <= inp(1);
z <= inp(0);
outp(0) <= enable and (not x) and (not y) and (not z);
outp(1) <= enable and (not x) and (not y) and ( z);
outp(2) <= enable and (not x) and (y) and (not z);
outp(3) <= enable and (not x) and ( y) and ( z);
outp(4) <= enable and ( x) and (not y) and (not z);
outp(5) <= enable and ( x) and (not y) and ( z);
outp(6) <= enable and ( x) and ( y) and (not z);
outp(7) <= enable and ( x) and (y) and ( z);


end Structural;


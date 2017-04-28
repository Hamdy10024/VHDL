----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:09:49 04/24/2017 
-- Design Name: 
-- Module Name:    Mux - Behavioral 
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

entity Mux is
    Port ( enable : in  STD_LOGIC;
           selector : in  STD_LOGIC_VECTOR (2 downto 0);
           inp : in  STD_LOGIC_VECTOR (7 downto 0);
           outp : out  STD_LOGIC);
end Mux;

architecture Structural of Mux is
signal temp: STD_LOGIC_VECTOR(7 downto 0):=X"00";
begin
temp(0) <= enable and (not selector(0)) and (not selector(1)) and (not selector(2)) and inp(0);

temp(1) <= enable and ( selector(0)) and (not selector(1)) and (not selector(2)) and inp(1);

temp(2) <= enable and (not selector(0)) and ( selector(1)) and (not selector(2)) and inp(2);

temp(3) <= enable and ( selector(0)) and ( selector(1)) and (not selector(2)) and inp(3);

temp(4) <= enable and (not selector(0)) and (not selector(1)) and ( selector(2)) and inp(4);

temp(5) <= enable and ( selector(0)) and (not selector(1)) and ( selector(2)) and inp(5);

temp(6) <= enable and (not selector(0)) and (selector(1)) and ( selector(2)) and inp(6);

temp(7) <= enable and ( selector(0)) and ( selector(1)) and ( selector(2)) and inp(7);
outp <= temp(0) or temp (1) or temp(2) or temp(3) or temp(4) or temp(5) or temp(6) or temp(7);

end Structural;


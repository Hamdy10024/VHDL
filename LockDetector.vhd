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

 component ProgrammingBlock PORT (
  clk : IN std_logic;
  mode: IN std_logic;
  input : IN std_logic_vector (2 downto 0); 
  lcdflag : OUT integer  range 0 to 7;
  firstNum : OUT Integer range 0 to 7 := 0;
  secondNum : OUT Integer range 0 to 7 := 0;
  thirdNum : OUT Integer range 0 to 7:=0);
end component;
component OperationBlock is
port (
    clk : in std_logic;
	slct : in std_logic;
	input : in std_logic_vector(2 downto 0);
    Digit1 : in integer range 0 to 7;
	Digit2 : in integer range 0 to 7;
	Digit3 : in integer range 0 to 7;
	dispCode : out integer range 0 to 7 -- 5 >> LOCK , 6 >> ERR , 7 >> OPEN
);
end component;

signal clock:STD_LOGIC:='0';
signal programSelect:STD_LOGIC :='0';

signal operationSelect:STD_LOGIC :='0';
signal fdigit: INTEGER RANGE 0 TO 7:=0;

signal sdigit: INTEGER RANGE 0 TO 7:=0;

signal tdigit: INTEGER RANGE 0 TO 7:=0;
signal message1 : INTEGER RANGE 0 TO 7 :=0;

signal message2 : INTEGER RANGE 0 TO 7 :=0;
begin
programSelect <= Mode;
operationSelect <= not Mode;
clockCycle : clockMaker port map (rise =>rise , fall=>fall ,clock=>clock);
program : ProgrammingBlock port map ( clk=>clock,mode =>programSelect ,input=>Digits , lcdflag =>message1
, firstNum => fdigit, secondNum => sdigit,  thirdNum => tdigit);
operation : OperationBlock port map ( clk => clock , slct =>operationSelect ,input => Digits , Digit1=>fdigit,
Digit2 =>sdigit, Digit3 => tdigit,dispCode => message2);


end Behavioral;


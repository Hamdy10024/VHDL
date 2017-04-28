----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:14:47 04/24/2017 
-- Design Name: 
-- Module Name:    TopModule - Behavioral 
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

entity TopModule is
Port ( x : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  rise : in STD_LOGIC;
			  fall : in STD_LOGIC;
			  selector: in STD_LOGIC_VECTOR(2 downto 0);
			  cheat : in STD_LOGIC;
			  z : out STD_LOGIC;
				enables : out std_logic_vector(3 downto 0);
				--decpoint : out std_logic ;
				sevenSeg : out std_logic_vector(7 downto 0)
				--; outp : out  STD_LOGIC_VECTOR (7 downto 0)
				);
end TopModule;
architecture structure of TopModule is
component clockdivider is Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           nclock : out  STD_LOGIC);
end component;

component Decoder is Port ( inp : in  STD_LOGIC_VECTOR (2 downto 0);
           enable : in  STD_LOGIC;
           outp : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Mux is Port ( enable : in  STD_LOGIC;
           selector : in  STD_LOGIC_VECTOR (2 downto 0);
           inp : in  STD_LOGIC_VECTOR (7 downto 0);
           outp : out  STD_LOGIC);
end component;


component stateEncoder is Port ( cheat : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           state : in  STD_LOGIC_VECTOR (2 downto 0);
           choice : out   integer range 0 to 9);
end component;
component machineEncoder is
    Port ( clock : in  STD_LOGIC;
           mach : in  STD_LOGIC_VECTOR (2 downto 0);
           digit0 : out   integer range 0 to 9;
			  digit1 : out   integer range 0 to 9;
			  digit2 : out   integer range 0 to 9);
end component;
component sevSeg is
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

end component;
component Machine1 is
  PORT (
  clk : IN std_logic;
  input: IN std_logic;
  output : OUT std_logic ; 
  state : out std_logic_vector (1 downto 0));
end component;

component Machine2 is
  PORT (
  clk : IN std_logic;
  input: IN std_logic;
  output : OUT std_logic ; 
  state : out std_logic_vector (2 downto 0));
end component;

component Machine3 is
  PORT (
  clk : IN std_logic;
  input: IN std_logic;
  output : OUT std_logic ; 
  state : out std_logic_vector (2 downto 0));
end component;

component Machine4 is
  PORT (
  clk : IN std_logic;
  input: IN std_logic;
  output : OUT std_logic ; 
  state : out std_logic_vector (2 downto 0));
end component;

component LDCP is
port (
Q : out STD_ULOGIC; -- Data output
CLR :in STD_ULOGIC; -- Asynchronous clear/reset input
D :in STD_ULOGIC; -- Data input
G  :in STD_ULOGIC; -- Gate input
PRE : in STD_ULOGIC -- Asynchronous preset/set input
);
end component;

signal d0: INTEGER Range 0 to 9:=0;
signal d1: INTEGER Range 0 to 9:=0;
signal d2: INTEGER Range 0 to 9:=0;
signal d3: INTEGER Range 0 to 9:=0;
signal manClock:STD_LOGIC :='0';

signal divclk:STD_LOGIC :='0';
signal states0: STD_LOGIC_VECTOR (7 downto 0):=x"00";

signal states1: STD_LOGIC_VECTOR (7 downto 0):=x"00";

signal states2: STD_LOGIC_VECTOR (7 downto 0):=x"00";


signal muxState: STD_LOGIC_VECTOR (2 downto 0):="000";
signal muxOut : STD_LOGIC:='0';
signal outs: STD_LOGIC_VECTOR (7 downto 0):=X"00";

signal state1: STD_LOGIC_VECTOR (1 downto 0):="00";

signal state2: STD_LOGIC_VECTOR (2 downto 0):="000";

signal state3: STD_LOGIC_VECTOR (2 downto 0):="000";

signal state4: STD_LOGIC_VECTOR (2 downto 0):="000";

signal state5: STD_LOGIC_VECTOR (2 downto 0):="000";
signal allClocks : STD_LOGIC_VECTOR (7 downto 0):=x"00";
--signal allClocks : STD_LOGIC_VECTOR (7 downto 0):=X"00";

constant zero:STD_LOGIC :='0';
constant one:STD_LOGIC :='1';
begin
clockplexing : Decoder Port map(enable => manClock , inp=>selector , outp=>allClocks);

--inputplexing : Decoder Port map(enable => x , inp=>selector , outp=>allClocks);
M1 : Machine1 port map ( clk => allClocks(0), input => x,state=>state1,output=>outs(0));

M2 : Machine2 port map ( clk => allClocks(1), input => x,state=>state2,output=>outs(1));

M3 : Machine3 port map ( clk => allClocks(2), input => x,state=>state3,output=>outs(2));

M4 : Machine4 port map ( clk => allClocks(3), input => x,state=>state4,output=>outs(3));

M5 : Machine4 port map ( clk => allClocks(6), input => x,state=>state5,output=>outs(6));
states0(0)<=state1(0);
states0(1)<=state2(0);
states0(2)<=state3(0);
states0(3)<=state4(0);
states0(6)<=state5(0);
states1(0)<=state1(1);
states1(1)<=state2(1);
states1(2)<=state3(1);
states1(3)<=state4(1);
states1(6)<=state5(1);
states2(0)<='0';
states2(1)<=state2(2);
states2(2)<=state3(2);
states2(3)<=state4(2);
states2(6)<=state5(2);

LDCP1: LDCP port map (Q => manClock, CLR => fall , D=>'0', G =>'0' , PRE => rise);
state0muxing : Mux port map(enable =>'1',selector =>selector,inp=>states0,outp=>muxState(0));

state1muxing : Mux port map(enable =>'1',selector =>selector,inp=>states1,outp=>muxState(1));

state2muxing : Mux port map(enable =>'1',selector =>selector,inp=>states2,outp=>muxState(2));

outmuxing : Mux port map(enable =>'1',selector =>selector,inp=>outs,outp=>muxOut);
stateEncoding : stateEncoder port map (cheat =>cheat,clock =>clk,state => muxState,choice=> d3);
clockDivision : clockdivider port map (clock => clk , reset =>'0' , nclock=>divclk);
machineEncoding : machineEncoder port map (clock => clk ,mach =>selector,digit0=>d0,digit1=>d1,digit2=>d2);
Display : sevSeg port map (clk => divclk,d0=>d0,d1=>d1,d2=>d2,d3=>d3,enables=>enables,sevenSeg=>sevenSeg);
z<= muxOut;
end structure;


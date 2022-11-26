----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2022 03:29:13 AM
-- Design Name: 
-- Module Name: MUXDigitSelector_tb - tb
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUXDigitSelector_tb is
--  Port ( );
end MUXDigitSelector_tb;

architecture tb of MUXDigitSelector_tb is
    component MUXDigitSelector
     Port ( D1 : in std_logic_vector(3 downto 0);
           D2 : in std_logic_vector(3 downto 0);
           D3 : in std_logic_vector(3 downto 0);
           D0 : in std_logic_vector(3 downto 0);
           --O1 : inout std_logic_vector;
           clk : in std_logic;
           A1 : out STD_LOGIC;
           B : out STD_LOGIC;
           C : out STD_LOGIC;
           D : out STD_LOGIC;
           E: out STD_LOGIC;
           F : out STD_LOGIC;
           G : out STD_LOGIC;
           
           anode1: out std_logic;
           anode2: out std_logic;
           anode3: out std_logic;
           anode0: out std_logic
           );
      end component;
      
      signal clock:std_logic := '0';
      constant period:time:= 10 ns;
      signal D0,D1,D2,D3 : std_logic_vector (3 downto 0) := "1011";
      signal A1,B,C,D,E,F,G : std_logic;
      signal anode0,anode1,anode2,anode3: std_logic;
begin
    clock_Process :process
    begin 
    clock <= '0';
    wait for period/2;
    clock <= '1';
    wait for period/2;
    end process;
    
    --now the clock has been made and can be simply connected to the port
    
    toTest : MUXDigitSelector port map(D0 => D0,D1 => D1, D2 => D2, D3 => D3,clk => clock, A1=> A1,B => B ,C => C, D=> D, E => E, F=> F, G => G,
    anode0 => anode0, anode1 => anode1, anode2 => anode2, anode3 => anode3); 
    
    D1 <= "0100";
    D2 <= "0000";
    D3 <= "1001";
end tb;

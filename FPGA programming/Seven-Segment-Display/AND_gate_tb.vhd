----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2022 11:43:50 AM
-- Design Name: 
-- Module Name: AND_gate_tb - tb
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

entity AND_gate_tb is
--  Port ( );
end AND_gate_tb;

architecture tb of AND_gate_tb is
    component AND_gate
    Port (a: in STD_LOGIC;
            b: in STD_LOGIC;
            c: out STD_LOGIC);
            end component;
    signal a,b: STD_LOGIC;
    signal c:STD_LOGIC;
begin
    UUT: AND_gate port map (a => a, b => b, c => c);
    a <= '0','1' after 30 ns, '0' after 70 ns;
    b <= '1', '0' after 45 ns, '1' after 65 ns;
end tb;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2022 01:26:22 AM
-- Design Name: 
-- Module Name: ClockSelector_tb - Behavioral
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

entity ClockSelector_tb is
--  Port ( );
--port (r1: out std_logic;
--r0 : out std_logic;
--clk : in std_logic);
end ClockSelector_tb;

architecture tb of ClockSelector_tb is
    component ClockSelector
    port (r1: out std_logic;
    r0 : out std_logic;
    clk : in std_logic
    );
    end component;
   constant period : time := 10 ns;
   signal a,b: std_logic;
   signal c: std_logic := '0';
begin
    UUT: ClockSelector port map(r0 => a,r1 => b, clk => c);
    clock_Process :process
    begin 
    c <= '0';
    wait for period/2;
    c <= '1';
    wait for period/2;
    end process;
end tb;

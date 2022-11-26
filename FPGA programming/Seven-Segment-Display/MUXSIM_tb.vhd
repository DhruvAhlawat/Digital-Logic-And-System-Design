----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2022 12:13:59 PM
-- Design Name: 
-- Module Name: MUXSIM_tb - tb
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

entity MUXSIM_tb is
--  Port ( );
end MUXSIM_tb;

architecture tb of MUXSIM_tb is
    component MUX_two
    Port (a: in STD_LOGIC;
    b : in STD_LOGIC;
    s : in STD_LOGIC;
    c : out STD_LOGIC);
    end component;
    
    signal a,b,c,s: STD_LOGIC;
begin
    UUT: MUX_two port map(a => a,b=>b,s=>s,c=>c);
    
    a <= '0','1' after 200 ns;
    b <= '1', '0' after 200 ns;
    s <= '0', '1' after 35 ns, '0' after 60 ns, '1' after 130 ns, '0' after 250 ns;

end tb;

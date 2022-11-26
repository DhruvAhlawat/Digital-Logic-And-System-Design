----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2022 11:55:36 AM
-- Design Name: 
-- Module Name: MUX_two - Behavioral
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

entity MUX_two is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : in STD_LOGIC;
           c : out STD_LOGIC);
end MUX_two;

architecture Behavioral of MUX_two is
    component AND_gate
    Port (a: in STD_LOGIC;
    b : in STD_LOGIC;
    c : out STD_LOGIC);
    end component;
    component OR_gate
    Port (a: in STD_LOGIC;
    b : in STD_LOGIC;
    c: out STD_LOGIC);
    end component;
    
    signal temp1,temp2 : STD_LOGIC;
begin
    ut1: AND_gate port map(a => a,b => not s,c => temp1);
    ut2: AND_gate port map(a => b, b => s, c => temp2);
    ut3: OR_gate port map(a => temp1,b => temp2,c=> c);

end Behavioral;

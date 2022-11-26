----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2022 04:05:17 PM
-- Design Name: 
-- Module Name: Decoder4To1 - Behavioral
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

entity Decoder4To1 is
    Port ( rr1 : in STD_LOGIC;
           rr0 : in STD_LOGIC;
           dd0 : in STD_LOGIC;
           dd1 : in STD_LOGIC;
           dd2 : in STD_LOGIC;
           dd3 : in STD_LOGIC;
           oo1 : out STD_LOGIC);
end Decoder4To1;

architecture Behavioral of Decoder4To1 is

begin
    oo1<= ((not rr0) and (not rr1) and dd0) or ((rr0) and (not rr1) and dd1) or ((not rr0) and (rr1) and dd2) or ((rr0) and (rr1) and dd3);

end Behavioral;

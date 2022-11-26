----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2022 10:17:19 AM
-- Design Name: 
-- Module Name: multiplier - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inbuiltMultiplier is
    Port(v0:in std_logic_vector(7 downto 0);
         v1:in std_logic_vector(7 downto 0);
         v2:out std_logic_vector(15 downto 0)
         );
end inbuiltMultiplier;

architecture Behavioral of inbuiltMultiplier is
--signal carry:std_logic:='0';
--signal temp:std_logic_vector(15 downto 0);
--signal dumcarry:std_logic:='0';
--signal dumvar:std_logic:='0';
begin

v2 <= std_logic_vector(unsigned(v0) * unsigned(v1));


end Behavioral;

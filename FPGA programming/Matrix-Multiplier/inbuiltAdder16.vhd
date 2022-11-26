----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2022 12:56:43 PM
-- Design Name: 
-- Module Name: Adder16Bit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inbuiltAdder is
    Port (a:in std_logic_vector(15 downto 0);
    b: in std_logic_vector(15 downto 0);
     c: out std_logic_vector(15 downto 0));
end inbuiltAdder;

architecture Behavioral of inbuiltAdder is
    
begin

c <= std_logic_vector(unsigned(a) + unsigned(b));
--should not overflow, hopefully
end Behavioral;

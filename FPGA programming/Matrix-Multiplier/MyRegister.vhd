----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2022 12:14:11 PM
-- Design Name: 
-- Module Name: MyRegister - Behavioral
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

entity MyRegister is
    Port ( clock : in STD_LOGIC;
           we : in STD_LOGIC;
           re : in STD_LOGIC;
           din : in std_logic_vector(15 downto 0);
           dout : out std_logic_vector(15 downto 0)
           );
end MyRegister;

architecture Behavioral of MyRegister is
    signal value: std_logic_vector(15 downto 0):= (others => '0');
    signal Readvalue: std_logic_vector(15 downto 0):= (others => '0');
begin
    OnClockRise: process(clock)
    begin
    if(clock'event and clock = '1') then
        if(we = '1') then
            value  <= din;
        end if;
--        if(re = '1') then
--            Readvalue <= value;    
--        end if;
         --value <= (we and din) or ((not we) and value);
    end if;
    end process; 
    dout <= value; --what are you using Readvalue for?
        
end Behavioral;

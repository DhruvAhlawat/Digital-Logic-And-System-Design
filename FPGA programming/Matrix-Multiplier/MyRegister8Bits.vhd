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

entity MyRegister8Bits is
    Port ( clock : in STD_LOGIC;
           we : in STD_LOGIC;
           re : in STD_LOGIC;
           din : in std_logic_vector(7 downto 0);
           dout : out std_logic_vector(7 downto 0)
           );
end MyRegister8Bits;

architecture Behavioral of MyRegister8Bits is
    signal value: std_logic_vector(7 downto 0) := (others => '0');
begin
    OnClockRise: process(clock)
    begin
    if(clock'event and clock = '1') then
        if(we = '1') then
            value <= din;
        end if; --reads value whenever write is 0n
       -- value <= (we and din) or ((not we) and value); does not work because din is an array
    end if;
    end process; 
    dout <= value; --assigns value to output directly
    --our implementation did not require read input's use

end Behavioral;

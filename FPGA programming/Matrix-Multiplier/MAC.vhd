----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2022 03:09:56 PM
-- Design Name: 
-- Module Name: MAC - Behavioral
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

entity MAC is
  Port (
  clk: in std_logic;
  num1: in std_logic_vector(7 downto 0);
  num2: in std_logic_vector(7 downto 0);
  cntrl: in std_logic;
  output: out std_logic_vector(15 downto 0)
  );
end MAC;

architecture Behavioral of MAC is
    component inbuiltMultiplier 
    Port(v0:in std_logic_vector(7 downto 0);
         v1:in std_logic_vector(7 downto 0);
         v2:out std_logic_vector(15 downto 0)
         );
    end component;
    
    component inbuiltAdder 
    Port (a:in std_logic_vector(15 downto 0);
    b: in std_logic_vector(15 downto 0);
     c: out std_logic_vector(15 downto 0));
    end component;
    
    signal AccumulatedValue: std_logic_vector(15 downto 0):= "0000000000000000";
    signal multValue: std_logic_vector(15 downto 0):= "0000000000000000";
    signal nextAccumulatedValue: std_logic_vector(15 downto 0):= "0000000000000000";
begin
    MultGate: inbuiltMultiplier port map(v0 => num1, v1 => num2, v2 => multValue);
    AddGate: inbuiltAdder port map(a=> AccumulatedValue, b=> multValue, c => nextAccumulatedValue);
    process(clk)
    begin
    --ensure num1 and num2 change at clock rising edge
    if(clk' event and clk = '1') then
        if(cntrl = '1') then 
           AccumulatedValue <= multValue;
           --ensure cntrl becomes 0 after 
        else 
           AccumulatedValue  <= nextAccumulatedValue;
        end if;
        --if outputs only storing next multiplication then this is the problem
    end if;
    end process;
    output  <= AccumulatedValue;

   -- output  <= std_logic_vector(unsigned(num1)*unsigned(num2));
    

end Behavioral;

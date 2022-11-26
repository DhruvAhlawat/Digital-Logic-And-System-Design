----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2022 02:49:18 PM
-- Design Name: 
-- Module Name: ClockSelector - Behavioral
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

entity ClockSelector is
    Port ( r1 : out STD_LOGIC;
           r0 : out STD_LOGIC;
                      clk : in STD_LOGIC;

           anode0 : out STD_LOGIC;
           anode1: out std_logic;
           anode2 : out std_logic;
           anode3 : out std_logic
           );
end ClockSelector;

architecture Behavioral of ClockSelector is


begin
process (clk)
variable cnt: integer:= 0;
variable s0: std_logic:= '0';
variable s1: std_logic:= '0';
begin

    if(clk' event and clk = '1') then
    cnt := cnt+1;
    r0 <= clk;
    if(cnt = 200000) then
    --r0 <= not s0;
    s0 := not s0;
    end if;
    
    if(cnt = 400000) then
    --r1 <= not s1;
    --r0 <= not s0;
    s0 := not s0;
    s1 := not s1;
    cnt := 0;
    end if;

    r0 <= s0;
    r1 <= s1;
    
    end if;
    
--    r0 <= clk;
--    r1 <= not clk;
   
    anode0  <= not ((not s0)and(not s1));
    anode1 <= not((not s1) and (s0));
    anode2 <= not((s1) and (not s0));
    anode3 <= not(s1 and s0);
    
    
    end process;

end Behavioral;

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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier is
    Port(v0:in std_logic_vector(7 downto 0);
         v1:in std_logic_vector(7 downto 0);
         v2:out std_logic_vector(15 downto 0)
         );
end multiplier;

architecture Behavioral of multiplier is
--signal carry:std_logic:='0';
--signal temp:std_logic_vector(15 downto 0);
--signal dumcarry:std_logic:='0';
--signal dumvar:std_logic:='0';
begin

mult:process

variable carry:std_logic:='0';
variable temp:std_logic_vector(15 downto 0);
variable dumvar:std_logic:='0';

begin

temp:="0000000000000000";
loop1:for i in 0 to 7 loop
wait for 1 ns;
carry:='0';
wait for 1 ns;
if(v0(i)='1') then
    loop2:for j in i to i+7 loop
 
    dumvar:=temp(j) xor v1(j-i) xor (carry);
    carry:= (v1(j-i) and carry) or (temp(j) and v1(j-i)) or (temp(j) and carry);
    wait for 1 ns;
    temp(j):=dumvar;
    wait for 1 ns;
    end loop loop2;
    wait for 1 ns;
    temp(i+8):=carry;
    wait for 1 ns;
end if;
end loop;

v2<=temp;
        
end process;  


end Behavioral;

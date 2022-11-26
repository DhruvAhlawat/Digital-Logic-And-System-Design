----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2022 12:12:55 PM
-- Design Name: 
-- Module Name: Decoder4to7 - Behavioral
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

entity Decoder4to7 is
    Port ( s1 : in STD_LOGIC;
           s2 : in STD_LOGIC;
           s3 : in STD_LOGIC;
           s0 : in STD_LOGIC;
--           an0 : out  std_logic ;
--           an1 : out  std_logic;
--           an2 : out  std_logic ;
--           an3 : out  std_logic;
            --an0: out std_logic;
            --an1: out std_logic;
           A : out STD_LOGIC;
           B : out STD_LOGIC;
           C : out STD_LOGIC;
           D : out STD_LOGIC;
           E : out STD_LOGIC;
           F : out STD_LOGIC;
           G : out STD_LOGIC
      
           );
end Decoder4to7;

architecture Behavioral of Decoder4to7 is

begin
    A <= (((not s3)and(not s1) and (((not s0)and(s2)) or ((not s2)and(s0)))) or((s3)and(not s2)and(s1)) or((s3)and(s2)and(not s1)))and(not((s1 and s3 and (not s0) and (not s2))));
    B <= (((not s3)and(s2)and(((not s1)and(s0)) or ((not s0)and(s1)))) or ((s3)and(not s2)and(s1)) or ((s3)and(s2)and(not s1)and(not s0)) or ((s3)and(s2)and(s1)and(s0)))and(not(s1 and s3 and (not s0) and (not s2)));
    C <= ((not s3)and(not s2)and(s1)and(not s0)) or ((s3)and(s2)and(not s0)) or ((s3)and(s2)and(s1)and(s0));
    D <= ((not s3)and(not s1)and(((not s2)and(s0)) or ((not s0)and(s2))))or((not s3)and(s2)and(s1)and(s0)) or ((s3)and(s2)and(s1)and(s0));
    E <= not(((((not s2)and((not(s1)and(not s0)))) or ((s1)and(not s3)and(not s0)))) or ((s3)and(not s2)and(s1)) or ((s3)and(s2)));
    F <= ((not s3)and(((not s2)and(((not s1)and(s0)) or ((not s0)and(s1)))) or (s1 and s0))) or ((s3)and(not s2)and(s1)and(not s0)) or ((s3)and(s2)and(not s1));
    G <= ((not s3)and(((not s2)and(not s1)) or ((s2)and(s1)and(s0))));
   --Dec <= '1';
   -- an0 <= '0';
    
end Behavioral;

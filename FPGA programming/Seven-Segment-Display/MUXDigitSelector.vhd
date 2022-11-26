----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2022 03:56:55 PM
-- Design Name: 
-- Module Name: MUXDigitSelector - Behavioral
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

entity MUXDigitSelector is
    Port ( D1 : in std_logic_vector(3 downto 0);
           D2 : in std_logic_vector(3 downto 0);
           D3 : in std_logic_vector(3 downto 0);
           D0 : in std_logic_vector(3 downto 0);
           --O1 : inout std_logic_vector;
           clk : in std_logic;
           A1 : out STD_LOGIC;
           B : out STD_LOGIC;
           C : out STD_LOGIC;
           D : out STD_LOGIC;
           E: out STD_LOGIC;
           F : out STD_LOGIC;
           G : out STD_LOGIC;
           
           anode1: out std_logic;
           anode2: out std_logic;
           anode3: out std_logic;
           anode0: out std_logic
           );
           
end MUXDigitSelector;

architecture Behavioral of MUXDigitSelector is
    Component Decoder4to7
    Port ( s1 : in STD_LOGIC;
           s2 : in STD_LOGIC;
           s3 : in STD_LOGIC;
           s0 : in STD_LOGIC;         
           A : out STD_LOGIC;
           B : out STD_LOGIC;
           C : out STD_LOGIC;
           D : out STD_LOGIC;
           E : out STD_LOGIC;
           F : out STD_LOGIC;
           G : out STD_LOGIC
           );
    end component;
    
    component ClockSelector
     Port ( r1 : out STD_LOGIC;
           r0 : out STD_LOGIC;
           clk : in STD_LOGIC;
           anode0 : out STD_LOGIC;
           anode1: out std_logic;
           anode2 : out std_logic;
           anode3 : out std_logic);
     end component;
    
    component Decoder4To1
     Port ( rr1 : in STD_LOGIC;
           rr0 : in STD_LOGIC;
           dd0 : in STD_LOGIC;
           dd1 : in STD_LOGIC;
           dd2 : in STD_LOGIC;
           dd3 : in STD_LOGIC;
           oo1 : out STD_LOGIC);
      end component;
        signal selector1, selector2: std_logic;
        signal O1: std_logic_vector(3 downto 0);
begin
    
    Clock1: ClockSelector  port map(r0 => selector2, r1 => selector1 ,clk => clk ,anode0  => anode0,anode1 => anode1, anode2 => anode2, anode3 => anode3);--, anode0  => anode0  , anode1 => anode1, anode2 => anode2, anode3 => anode3); 
    DEC0  : Decoder4To1 port map(rr1 => selector1 , rr0 => selector2 , dd0=>D0(0), dd1=>D1(0),dd2=>D2(0), dd3=>D3(0),oo1=>O1(0));
    DEC1  : Decoder4To1 port map(rr1 => selector1 , rr0 => selector2 , dd0=>D0(1), dd1=>D1(1),dd2=>D2(1), dd3=>D3(1),oo1=>O1(1));
    DEC2  : Decoder4To1 port map(rr1 => selector1 , rr0 => selector2 , dd0=>D0(2), dd1=>D1(2),dd2=>D2(2), dd3=>D3(2),oo1=>O1(2));
    DEC3  : Decoder4To1 port map(rr1 => selector1 , rr0 => selector2 , dd0=>D0(3), dd1=>D1(3),dd2=>D2(3), dd3=>D3(3),oo1=>O1(3));
    
    
--    anode0 <= not((not selector1)and(not selector2));
--    anode1 <= not((not selector1) and (selector2));
--    anode2 <= not((selector1) and (not selector2));
--    anode3 <= not(selector1 and selector2);
    
    
    final: Decoder4to7 port map (s0 => O1(0), s1 => O1(1), s2 => O1(2), s3 => O1(3), A => A1, B => B, C => C, D => D, E=> E, F => F, G => G);
    
end Behavioral;

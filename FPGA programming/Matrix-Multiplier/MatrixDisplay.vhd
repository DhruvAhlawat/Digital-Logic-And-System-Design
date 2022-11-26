----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2022 11:08:33 PM
-- Design Name: 
-- Module Name: MatrixDisplay - Behavioral
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

entity MatrixDisplay is
   Port (  D1 : in std_logic_vector(3 downto 0);
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
end MatrixDisplay;
   
architecture Behavioral of MatrixDisplay is
    
begin


end Behavioral;

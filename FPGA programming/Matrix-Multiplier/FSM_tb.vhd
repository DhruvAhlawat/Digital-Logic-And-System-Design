----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2022 12:14:07 AM
-- Design Name: 
-- Module Name: FSM_tb - Behavioral
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

entity FSM_tb is
--  Port ( );
end FSM_tb;

architecture Behavioral of FSM_tb is
    component FSMWorking
     Port (
           D0 : in std_logic_vector(13 downto 0);
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
           
--           ValueOutput: out std_logic_vector(15 downto 0);
--           AddressChecking: out std_logic_vector(13 downto 0);
--           outPutNum0:out std_logic_vector(3 downto 0);
--           outPutNum1: out std_logic_vector(3 downto 0);
--           outPutNum2:out  std_logic_vector(3 downto 0);
--           outPutNum3: out std_logic_vector(3 downto 0);
--           AddressCheckingInt: out integer
           );
    end component;
    signal     D0 :  std_logic_vector(13 downto 0) := "00000000000000";
           --O1 : inout std_logic_vector;
       signal    clk : std_logic;
      signal     A1 :  STD_LOGIC;
        signal   B :  STD_LOGIC;
        signal   C :  STD_LOGIC;
        signal   D :  STD_LOGIC;
        signal   E:  STD_LOGIC;
         signal  F :  STD_LOGIC;
          signal G :  STD_LOGIC;
           
         signal  anode1:  std_logic;
         signal  anode2:  std_logic;
         signal  anode3:  std_logic;
         signal  anode0: std_logic;
--         signal AddressChecking: std_logic_vector(13 downto 0);
--         signal adrInt: integer;
--         signal ValueOutput:std_logic_vector(15 downto 0);
         
--        signal out0: std_logic_vector(3 downto 0):= "0001";
--        signal out2: std_logic_vector(3 downto 0):= "0001";
--        signal out3: std_logic_vector(3 downto 0):= "0001";
--        signal out1: std_logic_vector(3 downto 0):= "0001";
begin
    process
    begin 
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    end process;
     
    UUT: FSMWorking port map(D0 => D0, anode0 => anode0,
     anode1 => anode1, anode2 => anode2, anode3 => anode3, clk => clk,
     A1=>A1,B => B, C => C, D=> D, E=> E, F=> F, G=> G); --, ValueOutput => ValueOutput, AddressChecking => AddressChecking,
--     outPutNum0 => out0,
--    outPutNum1 => out1,
--    outPutNum2 => out2,
--    outPutNum3 => out3, AddressCheckingInt => adrInt);
    
    D0 <= "00000000000011" after 100 ms, "00000000001111" after 200  ms;
end Behavioral;

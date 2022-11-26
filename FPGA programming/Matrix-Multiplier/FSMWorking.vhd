----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2022 11:57:24 AM
-- Design Name: 
-- Module Name: Final FSM - Behavioral
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

entity FSMWorking is
  Port (   D0 : in std_logic_vector(13 downto 0);
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
end FSMWorking;
architecture Behavioral of FSMWorking  is
    component MUXDigitSelector
    Port ( D3 : in std_logic_vector(3 downto 0);
           D2 : in std_logic_vector(3 downto 0);
           D1 : in std_logic_vector(3 downto 0);
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
    end component;
    component DistMatrixOne
    port(
        a: in std_logic_vector(13 downto  0);
        clk: in std_logic;
        spo: out std_logic_vector(7 downto 0)
    );
    end component;
    component DistMatrixTwo
    port(
        a: in std_logic_vector(13 downto  0);
        clk: in std_logic;
        spo: out std_logic_vector(7 downto 0)
        );
    end component;
    component OutputMatrix
    port(
     a: in std_logic_vector(13 downto 0);
     d: in std_logic_vector (15 downto 0);
     clk: in std_logic;
     we : in std_logic;
     spo: out std_logic_vector(15 downto 0)
     );
     end component;
     component MyRegister8Bits
     Port (clock : in STD_LOGIC;
           we : in STD_LOGIC;
           re : in STD_LOGIC;
           din : in std_logic_vector(7 downto 0);
           dout : out std_logic_vector(7 downto 0)
           );
     end component;
     component MyRegister
     Port ( clock : in STD_LOGIC;
           we : in STD_LOGIC;
           re : in STD_LOGIC;
           din : in std_logic_vector(15 downto 0);
           dout : out std_logic_vector(15 downto 0)
           );
     end component;
     component MAC
     Port (
      clk: in std_logic;
      num1: in std_logic_vector(7 downto 0);
      num2: in std_logic_vector(7 downto 0);
      cntrl: in std_logic;
      output: out std_logic_vector(15 downto 0)
      );
  end component;
     signal i: integer:= 0; --the address of the element of the first matrix  -- 0 hoga na idhar??
    signal j: integer:= 0; --the address of the second matrix
    signal AddrRam: integer := -1; -- Adress of ram position where data needs to be stored
    signal MACClk: std_logic := '0';
    signal MatrixDimension: integer := 128; --test karne  ke liye 4?
  
    type State is (Read,Processing,Writing,EndState, transitionState, SecondEndState);
    signal CurState : State := transitionState;
    signal NextState : State := Read;
    signal Done: std_logic := '0';
    
    signal writeRAM: std_logic:= '0';
    signal writeRegisterRam: std_logic:= '0';
    signal ReadRegisterRam: std_logic:= '0';
    signal readNum1:std_logic  := '0';
    signal readNum2:std_logic  := '0';
    signal writeNum1:std_logic  := '0';
    signal writeNum2:std_logic  := '0';
    signal cntrl:std_logic  := '0';
    signal readRAM:std_logic  := '0';
    signal AddrNum: integer := 0;
    
    signal secondNum : std_logic_vector(7 downto 0):= "00000000";
    signal firstNum : std_logic_vector(7 downto 0):= "00000000";
    signal storingOutPut : std_logic_vector(15 downto 0):= "0000000000000000";
    signal RegisterOutPut : std_logic_vector(15 downto 0) := "0000000000000000";
    
    signal ValueAtAddressOne: std_logic_vector(7 downto 0);
    signal ValueAtAddressTwo: std_logic_vector(7 downto 0);
    signal ValueAtRAM: std_logic_vector(15 downto 0);
    --signal clk : std_logic := '0';
    
    SIGNAL AddrJVec: std_logic_vector(13 downto 0);
    signal AddrIVec:std_logic_vector(13 downto 0);
    signal AddrRamVec:std_logic_vector(13 downto 0);
    
    signal RAMCheckingAddress: std_logic_vector(13 downto 0) := "00000000000000";
    signal RAMInt : integer := 0;
    signal counter: integer := 0;
    
    signal out0: std_logic_vector(3 downto 0):= "0001";
    signal out2: std_logic_vector(3 downto 0):= "0001";
    signal out3: std_logic_vector(3 downto 0):= "0001";
    signal out1: std_logic_vector(3 downto 0):= "0001";
    
    begin
    AddrIVec <= std_logic_vector(to_unsigned (i,14)) ;
    AddrJVec  <= std_logic_vector(to_unsigned (j,14));
    AddrRamVec <=  std_logic_vector(to_unsigned (AddrRam,14));
--    ValueOutput <= ValueAtRAM;
--    AddressChecking <= AddrRamVec;
--    AddressCheckingInt <= AddrRam;
    
--    outPutNum0 <= out0;
--    outPutNum1 <= out1;
--    outPutNum2 <= out2;
--    outPutNum3 <= out3;
--    simulateClock:process 
--    begin
--        clk <='0';
--        wait for 5 ns;
--        clk <= '1';
--        wait for 5 ns;
--    end process;
    
    --re ko nikal dete hai
    MACGate: MAC port map(clk => MACClk, num1 => firstNum , num2 => secondNum , cntrl => cntrl, output =>  storingOutPut);
    RegInput1 : MyRegister8Bits port map (clock => clk, we => writeNum1, re => readNum1 ,dout => firstNum,din => ValueAtAddressOne);
    Reginput2 : MyRegister8Bits port map (clock => clk, we => writeNum2, re => readNum2 ,dout => secondNum ,din => ValueAtAddressTwo);
    FirstMatrix : DistMatrixTwo  port map(a => AddrIVec, clk => clk, spo => ValueAtAddressOne);
    SecondMatrix: DistMatrixOne  port map(a => AddrJVec, clk => clk, spo => ValueAtAddressTwo);
    RegisterAtOut: MyRegister port map(clock => clk, we => writeRegisterRam, re => ReadRegisterRam, din => storingOutPut, dout => RegisterOutPut);
    OutPutting: OutputMatrix port map(a => AddrRamVec, d => RegisterOutPut , clk => clk, we => writeRAM, spo => ValueAtRAM);
    
    MatrixDisplayer : MUXDigitSelector port map(D0 => out0, D1 => out1, D2 => out2, D3 => out3, clk => clk, 
    anode0 => anode0, anode1 => anode1, anode2 => anode2, anode3 => anode3, A1 => A1, B => B, C=> C,
     D=> D,E => E, F=> F, G=>G); 
     
    out0(0) <= ValueAtRAM(0); out0(1) <= ValueAtRAM(1); out0(2) <= ValueAtRAM(2); out0(3) <= ValueAtRAM(3);
--    out1 <= ValueAtRAM(7 downto 4);
    out1(0) <= ValueAtRAM(4); out1(1) <= ValueAtRAM(5); out1(2) <= ValueAtRAM(6); out1(3) <= ValueAtRAM(7);
    out2(0) <= ValueAtRAM(8); out2(1) <= ValueAtRAM(9); out2(2) <= ValueAtRAM(10); out2(3) <= ValueAtRAM(11);
    out3(0) <= ValueAtRAM(12); out3(1) <= ValueAtRAM(13); out3(2) <= ValueAtRAM(14); out3(3) <= ValueAtRAM(15);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    
    
    readNum1 <= '1';
    readNum2 <= '1';
    StartStates:process(clk)
    begin
    if(clk 'event and clk = '1') then
       -- wait for 10 ns;
        
        if(counter = 2) then
        counter<=1;
        CurState <= NextState;
        else 
           counter <= counter + 1;
        end if;
    end if;
    end process;
    
    process(CurState)
    begin
    NextState  <= CurState;
    case CurState is
    when read =>
        
        MACClk <= '0';
        writeNum1 <= '1';
        writeNum2 <= '1'; --both write signals on so now the registers store the value from the address i and j
--        if(i mod MatrixDimension = 0) then 
--            cntrl <= '1';
        
        if(i mod MatrixDimension = 0 and not(j = 0 and i = 0)) then --j is not 0 so this is not the opening
            NextState <= Writing; --store the input from MAC
            writeRegisterRam <= '1'; --register stores the value from the MAC
            cntrl <= '1';
            writeRAM <= '1'; --writes the data to the RAM block at the AddrRAM location
            if(i = 16384) then --for now I am only multiply and adding 4 numbers in succession
                Done <= '1';
            end if;
            AddrRam <= AddrRam + 1; --incrementing the address of the RAM block to store there during Writing state
        else 
            NextState <= Processing;
            writeRegisterRam <= '0'; --register not storing the output from the MAC
            cntrl <= '0';
        end if;

    when Processing =>
            
            if(i mod MatrixDimension = MatrixDimension-1 and not(j= (MatrixDimension*MatrixDimension)-1)) then
            i<=i-MatrixDimension+1;
            j<=j+MatrixDimension-(MatrixDimension*MatrixDimension)+1;
            
            elsif(i mod MatrixDimension=MatrixDimension-1 and j=MatrixDimension*MatrixDimension-1) then
            i<=i+1;
            j<=0;
            
            else
            i<=i+1;
            j<=j+MatrixDimension;
            
            end if;
            
            writeNum1 <= '0'; writeNum2 <= '0'; --register no longer reading the input at the Addresses
             --Address moves to the next multiplication elements 
            writeRAM <= '0';
           
            --if came after Writing State, then Cntrl must be on in which case the accumalator doesn't add but stores the 
            --first multiplication
            NextState <= read; --goes back to read state
            writeRegisterRam <= '0'; --Register stops writing to make sure Register value remains unchanged
            MACClk <= '1'; -- Sends a rising edge to MAC which multiplies the 2 numbers and adds
    when Writing =>
        --write data at the address of the memory block
        --we can calculate the address as 
        
        writeRAM <= '1';
        if(done = '1') then
            NextState <= EndState;
        else 
            NextState <= Processing; --goes back to processing state (Cntrl is on)
        end if;
    when EndState =>
        NextState <= SecondEndState ;
        writeRAM <= '0';
        --then we display the values acc to input
        --RAMCheckingAddress  <= D0; --check if the concatenation works correctly
        --since 
        AddrRam <= to_integer(unsigned(D0));
       
    when transitionState => 
        NextState <= read;
    when SecondEndState =>  
        --RAMCheckingAddress  <= D0;
--        AddrRam <= to_integer(unsigned(D0));
        writeRAM <= '0';
        NextState <= EndState;
       -- out0(0) <= ValueAtRAM(0); out0(1) <= ValueAtRAM(1); out0(2) <= ValueAtRAM(2); out0(3) <= ValueAtRAM(3);
--      out1 <= ValueAtRAM(7 downto 4);
       -- out1(0) <= ValueAtRAM(4); out1(1) <= ValueAtRAM(5); out1(2) <= ValueAtRAM(6); out1(3) <= ValueAtRAM(7);
       -- out2(0) <= ValueAtRAM(8); out2(1) <= ValueAtRAM(9); out2(2) <= ValueAtRAM(10); out2(3) <= ValueAtRAM(11);
        --out3(0) <= ValueAtRAM(12); out3(1) <= ValueAtRAM(13); out3(2) <= ValueAtRAM(14); out3(3) <= ValueAtRAM(15);
        end case;
    
    end process;
    
    --convert the input taken to a number
    
    
    
    
end Behavioral;
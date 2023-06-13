library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IFetch is
    Port (clk: in STD_LOGIC;
          rst : in STD_LOGIC;
          en : in STD_LOGIC;
          BranchAddress : in STD_LOGIC_VECTOR(15 downto 0);
          JumpAddress : in STD_LOGIC_VECTOR(15 downto 0);
          Jump : in STD_LOGIC;
          PCSrc : in STD_LOGIC;
          Instruction : out STD_LOGIC_VECTOR(15 downto 0);
          PCinc : out STD_LOGIC_VECTOR(15 downto 0));
end IFetch;

architecture Behavioral of IFetch is

-- Memorie ROM
type tROM is array (0 to 255) of STD_LOGIC_VECTOR (15 downto 0);
signal ROM : tROM := (

               B"101_011_010_0000011" ,  	--ble $2, $3, 3           	
               B"100_011_011_0000000" ,    --neg $3, $3, $0        
               B"110_010_010_0000001"    ,   --subi $2, $2, 1        
               B"111_0000000000000",        --j 0                
               B"010_110_011_0000001",         --bne $3, $6, 1        
               B"001_000_000_0000001" ,    --addi $0, $0, 1        
               B"011_100_111_0000101",      --blez $7, $4, 5
               B"000_111_001_001_0_000",     --add $1, $1, $7        
               B"000_101_001_001_0_001",    --sub $1, $1, $5        
               B"001_101_101_0000001",        --addi $5,$5, 1        
               B"110_111_111_0000001",        --subi $7,$7, 1        
               B"111_0000000000110",        --j 6                
               B"001_001_110_0000000",        --addi $6, $1, 0        
               B"000_111_111_111_0_001",     --sub $7, $7, $7        
               B"001_111_111_0000011",        --addi $7, $7, 3        
               B"101_111_110_0000010"    ,   --ble $6, $7, 2        
               B"000_111_110_110_0_001",    --sub $6, $6, $7        
               B"111_0000000001111"    ,    --j 15            
               B"000_110_110_110_0_101",    --or $6, $6, $6    
       
                   others=>X"0000");

signal PC : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal PCAux, NextAddr, AuxSgn, AuxSgn1: STD_LOGIC_VECTOR(15 downto 0);

begin

    -- Program Counter
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                PC <= (others => '0');
            elsif en = '1' then
                PC <= NextAddr;
            end if;
        end if;
    end process;

    -- Instruction OUT
    Instruction <= ROM(conv_integer(PC(7 downto 0)));

    -- PC incremented
    PCAux <= PC + 1;
    PCinc <= PCAux;

    -- MUX Branch
    process(PCSrc, PCAux, BranchAddress)
    begin
        case PCSrc is 
            when '1' => AuxSgn <= BranchAddress;
            when others => AuxSgn <= PCAux;
        end case;
    end process;	

     -- MUX Jump
    process(Jump, AuxSgn, JumpAddress)
    begin
        case Jump is
            when '1' => NextAddr <= JumpAddress;
            when others => NextAddr <= AuxSgn;
        end case;
    end process;

end Behavioral;
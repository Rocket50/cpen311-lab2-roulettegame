library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package winDetectorDec is
  component win is
    port(spin_result : in unsigned(5 downto 0);
         bet1_value : in unsigned(5 downto 0);
         bet2_colour: in std_logic;
         bet3_dozen: in unsigned(1 downto 0);
         bet1_wins : out std_logic;
         bet2_wins : out std_logic;
         bet3_wins : out std_logic);
  end component;
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity win is
  port(spin_result : in unsigned(5 downto 0);
         bet1_value : in unsigned(5 downto 0);
         bet2_colour: in std_logic;
         bet3_dozen: in unsigned(1 downto 0);
         bet1_wins : out std_logic;
         bet2_wins : out std_logic;
         bet3_wins : out std_logic);
end entity; 

architecture impl of win is
  begin
    --Straightup bet subblock
    process(all) begin
      if(bet1_value = spin_result) then
        bet1_wins <= '1'; 
      else 
        bet1_wins <= '0';
      end if; 
    end process;
    
    --color bet subblock
    process(all) 
    
      variable unsg_result : unsigned(5 downto 0);
      variable winning_col : std_logic;
    
    begin

      unsg_result := spin_result; 
      --black = 0
      --red = 1
      
      if(spin_result(0) = '0') then
        if((unsg_result >= 1 and unsg_result <= 10) or (unsg_result >= 19 and unsg_result <= 28)) then
          winning_col := '0';
          
        else
          winning_col := '1';
        end if;
      else
        if((unsg_result >= 1 and unsg_result <= 10) or (unsg_result >= 19 and unsg_result <= 28)) then
          winning_col := '1'; 
        else
          winning_col := '0';
        end if;
      end if;
      
      if(winning_col = bet2_colour) then
        bet2_wins <= '1'; 
      else
        bet2_wins <= '0'; 
      end if;
      
      if(unsg_result = 0) then
        bet2_wins <= '0';
      end if;

    end process;
    
    --dozen bet subblock
    process(all) begin 
      report("Bet 3 dozen : " & to_String(bet3_dozen));
      if(bet3_dozen = "00" and spin_result >= 6d"1" and spin_result <= 6d"12") then
        bet3_wins <= '1'; 
      elsif(bet3_dozen = "01" and (spin_result >= 6d"13" and spin_result <= 6d"24")) then
        bet3_wins <= '1'; 
      elsif(bet3_dozen = "10" and (spin_result >= 6d"25" and spin_result <= 6d"36")) then
        bet3_wins <= '1'; 
      else
        bet3_wins <= '0';
        
      end if;
    end process; 
end impl;
library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

package newBalanceDec is
  component newBalance is
    port(money : in unsigned(11 downto 0);
         bet1_wins : in std_logic;
         bet2_wins : in std_logic;
         bet3_wins : in std_logic;
         
         bet1_amt : in unsigned(2 downto 0);
         bet2_amt : in unsigned(2 downto 0);
         bet3_amt : in unsigned(2 downto 0);
         
         new_money : out std_logic_vector(11 downto 0));
  end component;
end package; 

library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity newBalance is
  port(money : in unsigned(11 downto 0);
         bet1_wins : in std_logic;
         bet2_wins : in std_logic;
         bet3_wins : in std_logic;
         
         bet1_amt : in unsigned(2 downto 0);
         bet2_amt : in unsigned(2 downto 0);
         bet3_amt : in unsigned(2 downto 0);
         
         new_money : out std_logic_vector(11 downto 0));
end entity;

architecture impl of newBalance is
  
  constant BET1_RETURN : integer := 35;
  constant BET2_RETURN : integer := 1;
  constant BET3_RETURN : integer := 2;
  
  begin 
    
    process(all) 
      variable tempNewBalance : unsigned(11 downto 0);
      
      begin
      
      tempNewBalance := money;
      
      if(bet1_wins = '1') then
        tempNewBalance := tempNewBalance + bet1_amt * BET1_RETURN;
      else
        tempNewBalance := tempNewBalance - bet1_amt * BET1_RETURN;
      end if;
      
      if(bet2_wins = '1') then
        tempNewBalance := tempNewBalance + bet2_amt * BET2_RETURN;
      else
        tempNewBalance := tempNewBalance - bet2_amt * BET2_RETURN;
      end if;
      
      if(bet3_wins = '1') then
        tempNewBalance := tempNewBalance + bet3_amt * BET3_RETURN;
      else
        tempNewBalance := tempNewBalance - bet3_amt * BET3_RETURN;
      end if;
      
    end process;
end impl; 
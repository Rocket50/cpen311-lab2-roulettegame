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
         
         new_money : out unsigned(11 downto 0));
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
         
         new_money : out unsigned(11 downto 0));
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
        --report("Bet 1 has won, original bet : " & to_string(to_integer(bet1_amt)));
        --report("Bet 1 has won, original money : " & to_string(to_integer(tempNewBalance)));
     
        tempNewBalance := tempNewBalance + to_unsigned(to_integer(bet1_amt) * BET1_RETURN, tempNewBalance'LENGTH);
        --report("new balance : " & to_string(to_integer(tempNewBalance)));
      else
        tempNewBalance := tempNewBalance - bet1_amt;
      end if;
      
      if(bet2_wins = '1') then
        tempNewBalance := tempNewBalance + to_unsigned(to_integer(bet2_amt) * BET2_RETURN, tempNewBalance'LENGTH);
      else
        tempNewBalance := tempNewBalance - bet2_amt;
      end if;
      
      if(bet3_wins = '1') then
        tempNewBalance := tempNewBalance + to_unsigned(to_integer(bet3_amt) * BET3_RETURN, tempNewBalance'LENGTH);
      else
        tempNewBalance := tempNewBalance - bet3_amt;
      end if;
      
      new_money <= tempNewBalance;
      
    end process;
end impl; 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity doubleDabble is
  generic(outBits : integer := 4;
          inBits : integer);
  port(bin : in std_logic_vector(inBits-1 downto 0);
       bcd : out std_logic_vector(outBits-1 downto 0));
end entity;

architecture impl of doubleDabble is
  begin
    process(all)
    
      variable bcdTemp : unsigned(outBits-1 downto 0) := (others => '0'); 
    
    begin
      
      for I in 1 to inBits loop
        
      end loop;
        
      
    end process;
end impl; 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCDto7seg is
  generic(n : integer := 1);
  port(bcd : in std_logic_vector(n*4-1 downto 0);
       hex : out std_logic_vector(n*7 - 1 downto 0));
end entity;

architecture impl of BCDto7seg is
  
  type bcdLUT is array (9 downto 0) of std_logic_vector(6 downto 0);
  
  constant LUT : bcdLUT := 
    ("1111110", 
     "0110000", "1101101", "1111001",
     "0110011", "0110011", "1011111",
     "1110000", "1111111", "1111011");
  
  begin
    
    process(all) begin
      
      for I in 0 to n loop
        hex(I*7-1 downto I*7-1-7) <= LUT(to_integer(unsigned(bcd(I*4-1 downto I*4-1-4))));
      end loop;
      
    end process;
  
end impl;
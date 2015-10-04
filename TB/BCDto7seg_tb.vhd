library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.BCDto7segDec.all;
use work.binToBCDdec.all;

entity BCDto7seg_tb is
end entity; 

architecture impl of BCDto7seg_tb is
  
  signal bcd : std_logic_vector(11 downto 0);
  signal hex : std_logic_vector(20 downto 0);
  signal bin : std_logic_vector(8 downto 0);
  
  signal hex0 : std_logic_vector(6 downto 0);
  signal hex1 : std_logic_vector(6 downto 0);
  signal hex2 : std_logic_vector(6 downto 0);
begin
  
  DUT1 : binToBCD generic map(inBits => bin'LENGTH, outDigits => 3)
                   port map(bin => bin, bcd => bcd);
  
  DUT2 : BCDto7seg generic map(n => 3)
                  port map(bcd => bcd, hex => hex);
  
  hex0 <= hex(6 downto 0);
  hex1 <= hex(13 downto 7);
  hex2 <= hex(20 downto 14
  );
  process begin
    
    wait for 10 ps;
    
      for I in 1 to 100 loop
        
        bin <= std_logic_vector(to_unsigned(I, 9));
        wait for 10 ps;
      
      end loop;
    
    wait;
  end process;
end impl;
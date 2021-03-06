library ieee;
use ieee.std_logic_1164.all;
use work.binToBCDdec.all;
use ieee.numeric_std.all;

entity binToBCD_tb is
  
end entity;

architecture impl of binToBCD_tb is
  
  signal bin : std_logic_vector(8 downto 0);
  signal bcd : std_logic_vector(11 downto 0); 
  
  
  
  begin
    DUT : binToBCD generic map(inBits => 9, outDigits => 3)
                   port map(bin => bin, bcd => bcd);
                     
    process begin
      
      wait for 5 ps;
      
      for I in 1 to 511 loop
        
        bin <= std_logic_vector(to_unsigned(I, 9));
        wait for 10 ps;
        
      end loop;
      
      wait;
      
    end process;                 
                     
      
end impl;
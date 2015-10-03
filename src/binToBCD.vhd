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
      variable binTemp : unsigned(inBits-1 downto 0); 
    begin
      binTemp := unsigned(bin);
      for I in 1 to inBits loop
        bcdTemp := bcdTemp sll 1;
        bcdTemp(0) := binTemp(inBits-1);
        binTemp := binTemp sll 1;
        
        if(binTemp(3 downto 0) > 4) then
          bcdTemp := bcdTemp + 3;
          bcdTemp := bcdTemp sll 1;
        end if; 
        
        
      end loop;
        
        bcd <= std_logic_vector(bcdTemp);
    end process;
end impl; 
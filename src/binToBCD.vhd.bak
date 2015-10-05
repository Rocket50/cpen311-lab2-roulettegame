library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package binToBCDDecs is
  component binToBCD is
    generic(outDigits : integer := 1;
          inBits : integer);
    port(bin : in std_logic_vector(inBits-1 downto 0);
         bcd : out std_logic_vector(outDigits*4 downto 0));
  end component;
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;       

entity binToBCD is
  generic(outDigits : integer := 1;
          inBits : integer);
  port(bin : in std_logic_vector(inBits-1 downto 0);
       bcd : out std_logic_vector(outDigits*4-1 downto 0));
end entity;

architecture impl of binToBCD is
  begin
    process(all)
    
      variable bcdTemp : unsigned(outDigits*4-1 downto 0) := (others => '0'); 
      variable binTemp : unsigned(inBits-1 downto 0); 
    begin
      
      
      binTemp := unsigned(bin);
      bcdTemp := (others => '0');
      
      --report("binTemp is initially : " & to_string(binTemp));
      --report("bcdTemp is initially : " & to_string(bcdTemp));
      for I in 0 to inBits-1 loop
        
        
        
        for J in 0 to outDigits-1 loop
          
          --report("Checking slice: " & to_string(J*4+3) & "downto" & to_string(J*4));
          
          if bcdTemp(J*4+3 downto J*4) > 4 then
            bcdTemp(J*4+3 downto J*4) := bcdTemp(J*4+3 downto J*4) + 3;
            
            --report("ADDING 3");
            
            
          end if;
        end loop; 
        
        bcdTemp := bcdTemp sll 1;
        bcdTemp(0) := binTemp(inBits-1);
        
        binTemp := binTemp sll 1;

        --report("Shift number : " & to_string(I));
        --report("binTemp is now : " & to_string(binTemp));
        --report("bcdTemp is now : " & to_string(bcdTemp));
        
      end loop;
        
        bcd <= std_logic_vector(bcdTemp);
    end process;
end impl; 
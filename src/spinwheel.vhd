library ieee;
use ieee.std_logic_1164.all;

package spinwheelDecs is
  component spinwheel is
    port(clk : in std_logic;
         rst : in std_logic;
         spin_result : out std_logic_vector(5 downto 0));
  end component;
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spinwheel is
  port(clk : in std_logic;
       rst : in std_logic;
       spin_result : out std_logic_vector(5 downto 0));
end entity;

architecture impl of spinwheel is
  
  signal counter : std_logic_vector(5 downto 0) := (others => '0');
  
  begin
    spin_result <= counter;
    process(all) begin
      if(rising_edge(clk)) then
        if(unsigned(counter) >= 36) then
          counter <= (others => '0');
        else
          counter <= std_logic_vector(unsigned(counter) + 1);
        end if;
      end if;
    end process;
end impl; 
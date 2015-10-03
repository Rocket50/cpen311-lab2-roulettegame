library ieee;
use ieee.std_logic_1164.all;

package NbitReg is
  component NbitReg is
    generic(n : integer := 1);
    port(D : in std_logic_vector(n-1 downto 0);
         Q : out std_logic_vector(n-1 downto 0); 
         clk: in std_logic;
         rst: in std_logic);
  end component;
end package;

library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity NbitReg is
  generic(n : integer := 1);
  port(D : in std_logic_vector(n-1 downto 0);
       Q : out std_logic_vector(n-1 downto 0);
       clk: in std_logic;
       rst: in std_logic);
end entity;

architecture impl of NbitReg is
  begin
    process(all) begin
      if(rst = '0') then
        if(rising_edge(clk)) then
          Q <= D;
        end if;
      else
        Q <= std_logic_vector(to_unsigned(0, n));
      end if;
    end process;
end impl; 


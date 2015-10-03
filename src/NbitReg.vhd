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
    end process;
end impl; 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity roulette_top_tb is
end entity;

architecture impl of roulette_top_tb is
  
  component roulette_top is 
     port(SW : in std_logic_vector(17 downto 0);
       KEY : in std_logic_vector(3 downto 0);
       CLOCK_27 : in std_logic;
  		   HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : out std_logic_vector(6 downto 0);
  		   LEDR : out std_logic_vector(16 downto 0);
  		   LEDG : out std_logic_vector(7 downto 0));
  end component;
  
  signal     SW : std_logic_vector(17 downto 0)  := (others => '0');
  signal     KEY : std_logic_vector(3 downto 0) := (others => '0');
  signal     CLOCK_27 : std_logic  :=  '0';
  signal	    HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : std_logic_vector(6 downto 0) := (others => '0');
  signal		   LEDR : std_logic_vector(16 downto 0) := (others => '0');
  signal		   LEDG : std_logic_vector(7 downto 0) := (others => '0');
  
  begin
    DUT : roulette_top port map(SW => SW, KEY => KEY, CLOCK_27 => CLOCK_27, 
                                    HEX0 => HEX0, HEX1 => HEX1, HEX2 => HEX2, HEX3 => HEX3, HEX4 => HEX4,
                                    HEX5 => HEX5, HEX6 => HEX6, HEX7 => HEX7, LEDR => LEDR, LEDG => LEDG);
    
    process begin
    
      
      wait for 500 ps;
      wait; 
    end process;                            
    
end impl; 
library ieee;
use ieee.std_logic_1164.all;
use work.NbitRegDecs.all;
use ieee.numeric_std.all; 

entity roulette_top is
  port(SW : in std_logic_vector(17 downto 0);
       KEY : in std_logic_vector(3 downto 0);
       CLOCK_27 : in std_logic;
  		   HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : out std_logic_vector(6 downto 0);
  		   LEDG : out std_logic_vector(7 downto 0));
end roulette_top;

architecture impl of roulette_top is
  
  --components
  component spinwheel is
    port(clk : in std_logic;
         rst : in std_logic;
         spin_result : out std_logic_vector(5 downto 0));
  end component;
  
  component NbitReg is
    generic(n : integer := 1);
    port(D : in std_logic_vector(n-1 downto 0);
         Q : out std_logic_vector(n-1 downto 0); 
         clk: in std_logic;
         rst: in std_logic);
  end component;
  
  component newBalance is
    port(money : in unsigned(11 downto 0);
         bet1_wins : in std_logic;
         bet2_wins : in std_logic;
         bet3_wins : in std_logic;
         
         bet1_amt : in unsigned(2 downto 0);
         bet2_amt : in unsigned(2 downto 0);
         bet3_amt : in unsigned(2 downto 0);
         
         new_money : out std_logic_vector(11 downto 0));
  end component;
  
  component winDetector is
    port(spin_result : in std_logic_vector(5 downto 0);
         bet1_value : in std_logic_vector(5 downto 0);
         bet2_colour: in std_logic;
         bet3_dozen: in std_logic_vector(1 downto 0);
         bet1_wins : out std_logic;
         bet2_wins : out std_logic;
         bet3_wins : out std_logic);
  end component; 
  
  --wires
  signal spin_result : std_logic_vector(5 downto 0) := "000000";
  signal spin_result_latched : std_logic_vector(5 downto 0) := "000000";
  
  signal money : std_logic_vector(11 downto 0) := "000000000000";
  signal new_money : std_logic_vector(11 downto 0) := "000000000000";
  signal toMoneyFF : unsigned(11 downto 0) := "000000000000";
  
  signal bet1_value : std_logic_vector(5 downto 0) := "000000";
  signal bet2_colour : std_logic_vector(0 downto 0) := "0";
  signal bet2_colour_bit : std_logic := '0';
  signal bet3_dozen : std_logic_vector(1 downto 0) := "00";
    
  signal bet1_wins, bet2_wins, bet3_wins : std_logic := '0';
  
  signal bet1_amt, bet2_amt, bet3_amt : std_logic_vector(2 downto 0) := "000";
  signal bet1_amount, bet2_amount, bet3_amount : unsigned(2 downto 0) := "000";

begin
  
  --logic blocks
  num_draw : spinwheel port map(clk => CLOCK_27, rst => KEY(0), spin_result => spin_result);
  
  balance : newBalance port map(money => unsigned(money), new_money => new_money,
            bet1_wins => bet1_wins, bet2_wins => bet2_wins, bet3_wins => bet3_wins,
            bet1_amt => bet1_amount, bet2_amt => bet2_amount, bet3_amt => bet3_amount);
  
  win : winDetector port map(spin_result => spin_result,
                 bet1_value => bet1_value, bet2_colour => bet2_colour_bit, bet3_dozen => bet3_dozen,
                 bet1_wins => bet1_wins, bet2_wins => bet2_wins, bet3_wins => bet3_wins);
  
  --flip flops and conversions
  StateFFspin : NbitReg generic map (6) --spinwheel number
                  port map(rst => KEY(1), clk => KEY(3), D => spin_result, Q => spin_result_latched);
  
  StateFFbetnum : NbitReg generic map (6) --bet number
                  port map(rst => KEY(1), clk => KEY(3), D => SW(8 downto 3), Q => bet1_value);
 
  StateFFbetcolour : NbitReg generic map (1) --bet colour
                  port map(rst => KEY(1), clk => KEY(3), D => SW(12 downto 12), Q => bet2_colour);
  bet2_colour_bit <= bet2_colour(0);
  
  StateFFbetdozen : NbitReg generic map (2) --bet dozen
                  port map(rst => KEY(1), clk => KEY(3), D => SW(17 downto 16), Q => bet3_dozen);
  
  StateFFbet1amt : NbitReg generic map (3) --bet 1 amount
                  port map(rst => KEY(1), clk => KEY(3), D => SW(2 downto 0), Q => bet1_amt);
  
  bet1_amount <= unsigned(bet1_amt);
  
  StateFFbet2amt : NbitReg generic map (3) --bet 2 amount
                  port map(rst => KEY(1), clk => KEY(3), D => SW(11 downto 9), Q => bet2_amt);
  
  bet2_amount <= unsigned(bet2_amt);

  StateFFbet3amt : NbitReg generic map (3) --bet 3 amount
                  port map(rst => KEY(1), clk => KEY(3), D => SW(15 downto 13), Q => bet3_amt);
  
  bet3_amount <= unsigned(bet3_amt);
  
  StateFFmoney : NbitReg generic map (6) --previous money
                  port map(rst => KEY(1), clk => KEY(3), D => new_money, Q => money);
  
  toMoneyFF <= unsigned(money);
  
  LEDG(0) <= bet1_wins;
  LEDG(1) <= bet2_wins;
  LEDG(2) <= bet3_wins;
  
  
  
end impl;
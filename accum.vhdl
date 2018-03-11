library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;
-- entity accum is declared here
entity accum is
		  port(C, CLR : in  std_logic;   
    D in std_logic_vector(7 downto 0); 
		  E : in std_logic_vector(7 downto 0);
        Q : out std_logic_vector(15 downto 0)); 
end accum; 
architecture archi of accum is 

  --tmp is used for storing the result after each multiplicationa and addition 
  signal tmp: std_logic_vector(15 downto 0) := (others => '0');
  
  --curr holds the value of product of E and D 
  signal curr: std_logic_vector(15 downto 0) := (others => '0');
 
  
  -- this component calls the process in boothmult with  E and D as arguements and   
  -- he product is then stored in curr signal vector
 Component boothmult is 
 Port ( mpcd,mplr : in  STD_LOGIC_vector(7 downto 0);
          
           result : out  STD_LOGIC_vector(15 downto 0));
	end component;
begin 
   
b1 : boothmult port map ( E ,D , curr); 
    process (C,curr,CLR) 
      begin
        	-- if clr equal to 1 then tmp is assigned zero 
        if    (CLR='1') then	  
          tmp <= "0000000000000000"; 
        elsif ( C='1') then 
	-- multiplication value is added to the initially stored value of tmp
         tmp <=curr+tmp;  
       end if;
    end process;
    -- value of tmp is passed to Q (the output result)
    Q<=tmp;
end archi;

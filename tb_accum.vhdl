Library IEEE;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_accum IS
END tb_accum;
 
ARCHITECTURE behavior OF tb_accum IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT accum
    PORT(
         C : IN  std_logic;
         CLR : IN  std_logic;
         D : IN  std_logic_vector(7 downto 0);
         E : IN  std_logic_vector(7 downto 0);
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal C : std_logic := '0';
   signal CLR : std_logic := '0';
   signal D : std_logic_vector(7 downto 0) := (others => '0');
   signal E : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: accum PORT MAP (
          C => C,
          CLR => CLR,
          D => D,
          E => E,
          Q => Q
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
    
		E <="00001011";
		D <="00000001";
		C<='1';
		 wait for 250 ns;
		 D <="01001011";
		 E <="00010010";
		 
		 wait for 250 ns;
		 D <="00110011";
		 E <="01000010";
		
		wait for 250 ns;
		 D <="11100011";
		 E <="11111010";
		 
		  
      wait  ;
		
		 

     
   end process;

END;


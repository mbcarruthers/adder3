library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all; 

entity tb_adder3 is 
end entity; 


architecture RTL of tb_adder3 is 
    signal Clk, Clear, Output : std_logic := '0'; 
begin 
    uut : entity work.adder3 
    Port map(
        Clk => Clk, 
        Clear => Clear, 
        Output => Output
    ); 
    process 
    begin
        Clk <= '0'; 
        Clear <= '0'; 
        for i in 0 to 15 loop 
            Clk <= not Clk; 
            wait for 10 ns; 
        end loop; 
        Clear <= '1'; 
        Clk <= '1'; 
       wait for 20 ns; 
        wait; 
    end process; 
end architecture; 
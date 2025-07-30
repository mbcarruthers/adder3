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
        for i in 0 to 7 loop 
            Clk <= not Clk; 
            wait for 10 ns; 
        end loop; 
        wait;
    end process; 
end architecture; 
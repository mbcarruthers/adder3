library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity d_flop is
    Port(
        D      : in  std_logic;
        Clk    : in  std_logic;
        Output : out std_logic
    );
end entity;

architecture RTL of d_flop is
begin
    process(Clk)
    begin
        if rising_edge(clk) then
            if (D = '1') then
                Output <= '1';
            else
                Output <= '0';
            end if;
        end if;
    end process;
end architecture;

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity adder3 is
    Port(
        Clk    : in  std_logic;
        Clear  : in  std_logic;
        Output : out std_logic
    );
end entity;

architecture RTL of adder3 is
    signal A, B, C : std_logic;
begin
    b0 : entity work.d_flop
        Port map(
            D      => (not A and not Clear),
            Clk    => Clk,
            Output => A
        );
    b1 : entity work.d_flop
        Port map(
            D      => ((A xor B) and not Clear),
            Clk    => Clk,
            Output => B
        );
    b2 : entity work.d_flop
        Port map(
            D      => (((B and A) xor C) and not Clear),
            Clk    => Clk,
            Output => C
        );
    Output <= C;                        -- Simple output of C to see the results from addr3
end architecture;

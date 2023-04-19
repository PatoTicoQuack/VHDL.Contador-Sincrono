library ieee;
use ieee.std_logic_1164.all;

entity Controlador is
    port(
            j: out std_logic_vector(2 downto 0);
            k: out std_logic_vector(2 downto 0);
            q : in std_logic_vector(2 downto 0)
        );
end entity;

architecture controlar of Controlador is
begin

    j(2) <= q(1) and not(q(0));
    k(2) <= q(1) or not(q(0));
    j(1) <= q(0);
    k(1) <= q(2) or not(q(0));
    j(0) <= '1';
    k(0) <= not(q(2)) and q(1);
end architecture;

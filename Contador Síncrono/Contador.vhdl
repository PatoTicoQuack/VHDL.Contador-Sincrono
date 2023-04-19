library ieee;
use ieee.std_logic_1164.all;

entity Contador is
    port(
            reset: in std_logic;
            clk : in std_logic;
            s : out std_logic_vector (2 downto 0)
        );
end Contador;

architecture contar of Contador is
component Controlador is
        port(
            j: out std_logic_vector(2 downto 0);
            k: out std_logic_vector(2 downto 0);
            q : in std_logic_vector(2 downto 0)
        );
    end component;
    component FFJKNormal is
        port(
            j, k : in std_logic;
            clock: in std_logic;
            pr, cl: in std_logic;
            q, nq : out std_logic
        );
    end component;

        signal sreset: std_logic;
        signal spr: std_logic;
        signal sj: std_logic_vector(2 downto 0);
        signal sk: std_logic_vector(2 downto 0);
        signal sq: std_logic_vector(2 downto 0);
        signal snq: std_logic_vector(2 downto 0); 
begin
    spr <= '1';
    u_cont0 : FFJKNormal port map(sj(0), sk(0), clk, spr, reset, sq(0), snq(0));
    u_cont1 : FFJKNormal port map(sj(1), sk(1), clk, spr, reset, sq(1), snq(1));
    u_cont2 : FFJKNormal port map(sj(2), sk(2), clk, spr, reset, sq(2), snq(2));
    u_controlador : controlador port map(sj, sk, sq);
    s <= sq;
end architecture;

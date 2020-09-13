LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY servo_driver IS
    GENERIC (
        starting_position : INTEGER := 150
    );
    PORT (
        clk : IN std_logic;
        clk_div : IN unsigned(30 DOWNTO 0);
        move : IN std_logic;
        move_now : IN std_logic;
        goto_pos : IN INTEGER;
        speed : IN INTEGER;

        pulse : OUT std_logic;
        duty_out : OUT INTEGER
    );
END ENTITY servo_driver;

ARCHITECTURE rtl OF servo_driver IS

    SIGNAL duty_cycle : INTEGER := starting_position;

BEGIN

    pwm_servo : ENTITY work.pwm(rtl)
        GENERIC MAP(
            count_max_val => "00000000000011110100001001000000"
        )
        PORT MAP(
            clk => clk,
            pulse => pulse,
            duty_cycle => duty_cycle
        );

    ------------------------------------------------------------------------
    ------------------------------------------------------------------------

    duty_out <= duty_cycle;

    positioning : PROCESS (clk)
        VARIABLE flag : std_logic := '0';
    BEGIN
        IF rising_edge(clk) THEN

            IF goto_pos /= 0 THEN

                IF move = '1' THEN
                    IF clk_div(speed) = '1' AND flag = '0' THEN
                        IF duty_cycle < goto_pos THEN
                            duty_cycle <= duty_cycle + 1;
                            flag := '1';
                        ELSIF duty_cycle > goto_pos THEN
                            duty_cycle <= duty_cycle - 1;
                            flag := '1';
                        END IF;
                    END IF;
                    IF clk_div(speed) = '0' AND flag = '1' THEN
                        flag := '0';
                    END IF;

                ELSIF move_now = '1' THEN
                    duty_cycle <= goto_pos;
                END IF;

            END IF;
        END IF;
    END PROCESS positioning;

END ARCHITECTURE rtl;
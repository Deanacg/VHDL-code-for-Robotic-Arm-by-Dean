LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY robotic_arm_wrapper_TEST IS
    PORT (
        clk : IN std_logic;

        --inputs with numbers matching respective arduino pins
        an_input_2 : IN std_logic := '1';
        an_input_3 : IN std_logic := '1';
        an_input_4 : IN std_logic := '1';
        an_input_5 : IN std_logic := '1';
        an_input_6 : IN std_logic := '1';
        an_input_7 : IN std_logic := '1';
        an_input_8 : IN std_logic := '1';
        an_input_9 : IN std_logic := '1';
        an_input_10 : IN std_logic := '1';
        an_input_11 : IN std_logic := '1';
        an_input_12 : IN std_logic := '1';
        an_input_13 : IN std_logic := '1';
        an_input_14 : IN std_logic := '1';
        an_input_16 : IN std_logic := '1';

        pulse_1 : OUT std_logic;
        pulse_2 : OUT std_logic;
        pulse_3 : OUT std_logic;
        pulse_4 : OUT std_logic;
        pulse_5 : OUT std_logic;
        pulse_6 : OUT std_logic;
        pulse_7 : OUT std_logic;
        pulse_8 : OUT std_logic
    );
END ENTITY robotic_arm_wrapper_TEST;

ARCHITECTURE rtl OF robotic_arm_wrapper IS

    SIGNAL clk_div : unsigned(30 DOWNTO 0);
    SIGNAL duty_cycle_1 : INTEGER := 150;
    SIGNAL duty_cycle_2 : INTEGER := 150;
    SIGNAL duty_cycle_3 : INTEGER := 160;
    SIGNAL duty_cycle_4 : INTEGER := 150;
    SIGNAL duty_cycle_5 : INTEGER := 150;
    SIGNAL duty_cycle_6 : INTEGER := 150;
    SIGNAL duty_cycle_7 : INTEGER := 150;
    SIGNAL duty_cycle_8 : INTEGER := 70;

    SIGNAL count : unsigned(10 DOWNTO 0);

BEGIN

    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------

    pwm_servo_1 : ENTITY work.pwm(rtl)
        GENERIC MAP(
            count_max_val => "00000000000011110100001001000000"
        )
        PORT MAP(
            clk => clk,
            pulse => pulse_1,
            duty_cycle => duty_cycle_1
        );

    pwm_servo_2 : ENTITY work.pwm(rtl)
        GENERIC MAP(
            count_max_val => "00000000000011110100001001000000"
        )
        PORT MAP(
            clk => clk,
            pulse => pulse_2,
            duty_cycle => duty_cycle_2
        );

    pwm_servo_3 : ENTITY work.pwm(rtl)
        GENERIC MAP(
            count_max_val => "00000000000011110100001001000000"
        )
        PORT MAP(
            clk => clk,
            pulse => pulse_3,
            duty_cycle => duty_cycle_3
        );

    pwm_servo_4 : ENTITY work.pwm(rtl)
        GENERIC MAP(
            count_max_val => "00000000000011110100001001000000"
        )
        PORT MAP(
            clk => clk,
            pulse => pulse_4,
            duty_cycle => duty_cycle_4
        );

    pwm_servo_5 : ENTITY work.pwm(rtl)
        GENERIC MAP(
            count_max_val => "00000000000011110100001001000000"
        )
        PORT MAP(
            clk => clk,
            pulse => pulse_5,
            duty_cycle => duty_cycle_5
        );

    pwm_servo_6 : ENTITY work.pwm(rtl)
        GENERIC MAP(
            count_max_val => "00000000000011110100001001000000"
        )
        PORT MAP(
            clk => clk,
            pulse => pulse_6,
            duty_cycle => duty_cycle_6
        );

    pwm_servo_7 : ENTITY work.pwm(rtl)
        GENERIC MAP(
            count_max_val => "00000000000011110100001001000000"
        )
        PORT MAP(
            clk => clk,
            pulse => pulse_7,
            duty_cycle => duty_cycle_7
        );

    pwm_servo_8 : ENTITY work.pwm(rtl)
        GENERIC MAP(
            count_max_val => "00000000000011110100001001000000"
        )
        PORT MAP(
            clk => clk,
            pulse => pulse_8,
            duty_cycle => duty_cycle_8
        );
    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------
    clock_div_counter : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF clk_div = 1 THEN
                clk_div <= (OTHERS => '0');
            ELSE
                clk_div <= clk_div + 1;
            END IF;
        END IF;
    END PROCESS clock_div_counter;

    ----- One process per duty_cycle signal ----------------------------------------

    proc_1 : PROCESS (clk, duty_cycle_6, duty_cycle_7, an_input_10)

    BEGIN

        IF rising_edge(clk) THEN

            IF an_input_10 = '0' THEN
                duty_cycle_6 <= 100;
                duty_cycle_7 <= 200;
            END IF;

        END IF;

    END PROCESS proc_1;

   
END ARCHITECTURE rtl;
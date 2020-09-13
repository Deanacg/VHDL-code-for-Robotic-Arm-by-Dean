LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY robotic_arm_wrapper IS
    PORT (
        clk : IN std_logic;

        --inputs with numbers matching respective arduino pins
        an_input_2 : IN std_logic;
        an_input_3 : IN std_logic;
        an_input_4 : IN std_logic;
        an_input_5 : IN std_logic;
        an_input_6 : IN std_logic;
        an_input_7 : IN std_logic;
        an_input_8 : IN std_logic;
        an_input_9 : IN std_logic;
        an_input_10 : IN std_logic;
        an_input_11 : IN std_logic;
        an_input_12 : IN std_logic;
        an_input_13 : IN std_logic;
        an_input_14 : IN std_logic;
        an_input_16 : IN std_logic;
        an_input_17 : IN std_logic;
        an_input_18 : IN std_logic;
        an_input_19 : IN std_logic;

        pulse_1 : OUT std_logic;
        pulse_2 : OUT std_logic;
        pulse_3 : OUT std_logic;
        pulse_4 : OUT std_logic;
        pulse_5 : OUT std_logic;
        pulse_6 : OUT std_logic;
        pulse_7 : OUT std_logic;
        pulse_8 : OUT std_logic;

        leds : OUT std_logic_vector(2 DOWNTO 0)

    );
END ENTITY robotic_arm_wrapper;

ARCHITECTURE rtl OF robotic_arm_wrapper IS

    SIGNAL clk_div : unsigned(30 DOWNTO 0);

    SIGNAL move_1 : std_logic;
    SIGNAL move_2 : std_logic;
    SIGNAL move_3 : std_logic;
    SIGNAL move_4 : std_logic;
    SIGNAL move_5 : std_logic;
    SIGNAL move_6 : std_logic;
    SIGNAL move_7 : std_logic;
    SIGNAL move_8 : std_logic;

    SIGNAL move_now_1 : std_logic;
    SIGNAL move_now_2 : std_logic;
    SIGNAL move_now_3 : std_logic;
    SIGNAL move_now_4 : std_logic;
    SIGNAL move_now_5 : std_logic;
    SIGNAL move_now_6 : std_logic;
    SIGNAL move_now_7 : std_logic;
    SIGNAL move_now_8 : std_logic;

    SIGNAL goto_pos_1 : INTEGER;
    SIGNAL goto_pos_2 : INTEGER;
    SIGNAL goto_pos_3 : INTEGER;
    SIGNAL goto_pos_4 : INTEGER;
    SIGNAL goto_pos_5 : INTEGER;
    SIGNAL goto_pos_6 : INTEGER;
    SIGNAL goto_pos_7 : INTEGER;
    SIGNAL goto_pos_8 : INTEGER;

    SIGNAL duty_out_1 : INTEGER;
    SIGNAL duty_out_2 : INTEGER;
    SIGNAL duty_out_3 : INTEGER;
    SIGNAL duty_out_4 : INTEGER;
    SIGNAL duty_out_5 : INTEGER;
    SIGNAL duty_out_6 : INTEGER;
    SIGNAL duty_out_7 : INTEGER;
    SIGNAL duty_out_8 : INTEGER;

    SIGNAL speed : INTEGER := 18;

    SIGNAL leds_sig : std_logic_vector(2 DOWNTO 0);

BEGIN

    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------

    servo_driver_1 : ENTITY work.servo_driver(rtl)
        GENERIC MAP(
            starting_position => 160
        )
        PORT MAP(
            clk => clk,
            clk_div => clk_div,
            move => move_1,
            move_now => move_now_1,
            goto_pos => goto_pos_1,
            speed => speed,
            -- Outputs
            pulse => pulse_1,
            duty_out => duty_out_1
        );

    servo_driver_2 : ENTITY work.servo_driver(rtl)
        GENERIC MAP(
            starting_position => 140
        )
        PORT MAP(
            clk => clk,
            clk_div => clk_div,
            move => move_2,
            move_now => move_now_2,
            goto_pos => goto_pos_2,
            speed => speed,
            -- Outputs
            pulse => pulse_2,
            duty_out => duty_out_2
        );

    servo_driver_3 : ENTITY work.servo_driver(rtl)
        GENERIC MAP(
            starting_position => 160
        )
        PORT MAP(
            clk => clk,
            clk_div => clk_div,
            move => move_3,
            move_now => move_now_3,
            goto_pos => goto_pos_3,
            speed => speed,
            -- Outputs
            pulse => pulse_3,
            duty_out => duty_out_3
        );

    servo_driver_4 : ENTITY work.servo_driver(rtl)
        GENERIC MAP(
            starting_position => 150
        )
        PORT MAP(
            clk => clk,
            clk_div => clk_div,
            move => move_4,
            move_now => move_now_4,
            goto_pos => goto_pos_4,
            speed => speed,
            -- Outputs
            pulse => pulse_4,
            duty_out => duty_out_4
        );

    servo_driver_5 : ENTITY work.servo_driver(rtl)
        GENERIC MAP(
            starting_position => 150
        )
        PORT MAP(
            clk => clk,
            clk_div => clk_div,
            move => move_5,
            move_now => move_now_5,
            goto_pos => goto_pos_5,
            speed => speed,
            -- Outputs
            pulse => pulse_5,
            duty_out => duty_out_5
        );

    servo_driver_6 : ENTITY work.servo_driver(rtl)
        GENERIC MAP(
            starting_position => 120
        )
        PORT MAP(
            clk => clk,
            clk_div => clk_div,
            move => move_6,
            move_now => move_now_6,
            goto_pos => goto_pos_6,
            speed => speed,
            -- Outputs
            pulse => pulse_6,
            duty_out => duty_out_6
        );

    servo_driver_7 : ENTITY work.servo_driver(rtl)
        GENERIC MAP(
            starting_position => 180
        )
        PORT MAP(
            clk => clk,
            clk_div => clk_div,
            move => move_7,
            move_now => move_now_7,
            goto_pos => goto_pos_7,
            speed => speed,
            -- Outputs
            pulse => pulse_7,
            duty_out => duty_out_7
        );

    servo_driver_8 : ENTITY work.servo_driver(rtl)
        GENERIC MAP(
            starting_position => 70
        )
        PORT MAP(
            clk => clk,
            clk_div => clk_div,
            move => move_8,
            move_now => move_now_8,
            goto_pos => goto_pos_8,
            speed => speed,
            -- Outputs
            pulse => pulse_8,
            duty_out => duty_out_8
        );

    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------
    clk_div_counter : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            clk_div <= clk_div + 1;
        END IF;
    END PROCESS clk_div_counter;
    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------

    leds <= leds_sig;

    blink : PROCESS (clk) --flashes onboard LEDs at clk_div(speed)
    BEGIN
        IF rising_edge(clk) THEN
            IF clk_div(speed) = '1' THEN
                IF leds_sig = "111" THEN
                    leds_sig <= "000";
                ELSE
                    leds_sig <= "111";
                END IF;
            END IF;
        END IF;
    END PROCESS blink;

    process_MOVE : PROCESS (clk)

    BEGIN
        IF rising_edge(clk) THEN
            IF an_input_2 = '0' THEN --buttons_2_and_4_claw
                goto_pos_8 <= 70;
                move_8 <= '1';
            ELSIF an_input_4 = '0' THEN
                goto_pos_8 <= 140;
                move_8 <= '1';

            ELSIF an_input_5 = '0' THEN --buttons_5_and_7_turn
                goto_pos_3 <= 260;
                move_3 <= '1';
            ELSIF an_input_7 = '0' THEN -- clk wize
                goto_pos_3 <= 40;
                move_3 <= '1';

            ELSIF an_input_8 = '0' THEN --buttons_8_and_10_lift
                goto_pos_1 <= 40;
                goto_pos_2 <= 260;
                move_1 <= '1';
                move_2 <= '1';
            ELSIF an_input_10 = '0' THEN
                goto_pos_1 <= 260;
                goto_pos_2 <= 40;
                move_1 <= '1';
                move_2 <= '1';

            ELSIF an_input_3 = '0' THEN --buttons_3_and_9_lift
                goto_pos_4 <= 260;
                goto_pos_5 <= 40;
                move_4 <= '1';
                move_5 <= '1';
            ELSIF an_input_9 = '0' THEN
                goto_pos_4 <= 40;
                goto_pos_5 <= 260;
                move_4 <= '1';
                move_5 <= '1';

            ELSIF an_input_16 = '0' THEN --buttons_16_and_12_claw_lift
                goto_pos_6 <= 40;
                goto_pos_7 <= 260;
                move_6 <= '1';
                move_7 <= '1';
            ELSIF an_input_12 = '0' THEN
                goto_pos_6 <= 260;
                goto_pos_7 <= 40;
                move_6 <= '1';
                move_7 <= '1';

            ELSIF an_input_6 = '0' THEN --button_6_center
                goto_pos_4 <= 160;
                goto_pos_5 <= 140;
                move_4 <= '1';
                move_5 <= '1';
                IF duty_out_4 = 160 AND duty_out_5 = 140 THEN
                    goto_pos_6 <= 120;
                    goto_pos_7 <= 180;
                    move_6 <= '1';
                    move_7 <= '1';
                END IF;
                IF duty_out_6 = 120 AND duty_out_7 = 180 THEN
                    move_6 <= '0';
                    move_7 <= '0';
                    goto_pos_6 <= 0; -- shutting down servos 6 and 7 to stop shaking
                    goto_pos_7 <= 0;
                    move_now_6 <= '1';
                    move_now_7 <= '1';
                    goto_pos_3 <= 160;
                    move_3 <= '1';
                END IF;

            ELSIF an_input_18 = '0' THEN --Get up
                IF duty_out_4 /= 260 THEN
                    goto_pos_4 <= 260;
                    goto_pos_5 <= 40;
                    move_4 <= '1';
                    move_5 <= '1';
                ELSIF duty_out_4 = 260 THEN
                    goto_pos_1 <= 230;
                    goto_pos_2 <= 70;
                    move_1 <= '1';
                    move_2 <= '1';
                ELSIF duty_out_1 = 230 THEN
                    goto_pos_4 <= 150;
                    goto_pos_5 <= 150;
                    move_4 <= '1';
                    move_5 <= '1';
                END IF;

            ELSIF an_input_19 = '0' THEN
                goto_pos_6 <= 0; -- shutting down servos 6 and 7 and 3 to stop shaking
                goto_pos_7 <= 0;
                move_now_6 <= '1';
                move_now_7 <= '1';
                goto_pos_3 <= 0;
                move_now_3 <= '1';

            ELSE
                move_1 <= '0';
                move_2 <= '0';
                move_3 <= '0';
                move_4 <= '0';
                move_5 <= '0';
                move_6 <= '0';
                move_7 <= '0';
                move_8 <= '0';

                move_now_1 <= '0';
                move_now_2 <= '0';
                move_now_3 <= '0';
                move_now_4 <= '0';
                move_now_5 <= '0';
                move_now_6 <= '0';
                move_now_7 <= '0';
                move_now_8 <= '0';
            END IF;

        END IF;
    END PROCESS process_MOVE;

END ARCHITECTURE rtl;
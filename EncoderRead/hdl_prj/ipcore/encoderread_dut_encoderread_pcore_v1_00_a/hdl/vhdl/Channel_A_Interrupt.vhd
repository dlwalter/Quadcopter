-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\EncoderRead\Channel_A_Interrupt.vhd
-- Created: 2015-02-11 17:56:59
-- 
-- Generated by MATLAB 8.4 and HDL Coder 3.5
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Channel_A_Interrupt
-- Source Path: EncoderRead/dut_EncoderRead/Channel A Interrupt
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.dut_EncoderRead_pkg.ALL;

ENTITY Channel_A_Interrupt IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        A                                 :   IN    std_logic;
        B                                 :   IN    std_logic;
        reset_1                           :   IN    std_logic;
        enable                            :   IN    std_logic;
        count                             :   OUT   std_logic_vector(31 DOWNTO 0)  -- int32
        );
END Channel_A_Interrupt;


ARCHITECTURE rtl OF Channel_A_Interrupt IS

  -- Signals
  SIGNAL is_Channel_A_Interrupt           : T_state_type_is_Channel_A_Interrupt;  -- uint8
  SIGNAL count_tmp                        : signed(31 DOWNTO 0);  -- int32
  SIGNAL reset_val                        : std_logic;
  SIGNAL count_reg                        : signed(31 DOWNTO 0);  -- int32
  SIGNAL is_Channel_A_Interrupt_next      : T_state_type_is_Channel_A_Interrupt;  -- enum type state_type_is_Channel_A_Interrupt (4 enums)
  SIGNAL reset_val_next                   : std_logic;
  SIGNAL count_reg_next                   : signed(31 DOWNTO 0);  -- int32

BEGIN
  Channel_A_Interrupt_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      is_Channel_A_Interrupt <= IN_I4;
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        is_Channel_A_Interrupt <= is_Channel_A_Interrupt_next;
        reset_val <= reset_val_next;
        count_reg <= count_reg_next;
      END IF;
    END IF;
  END PROCESS Channel_A_Interrupt_1_process;
  Channel_A_Interrupt_1_output : PROCESS (is_Channel_A_Interrupt, A, B, reset_1, reset_val, enable, count_reg)
    VARIABLE guard1 : std_logic;
    VARIABLE guard2 : std_logic;
    VARIABLE reset_val_temp : std_logic;
    VARIABLE add_temp : signed(32 DOWNTO 0);
    VARIABLE add_temp_0 : signed(32 DOWNTO 0);
    VARIABLE sub_temp : signed(32 DOWNTO 0);
    VARIABLE sub_temp_0 : signed(32 DOWNTO 0);
  BEGIN
    reset_val_temp := reset_val;
    is_Channel_A_Interrupt_next <= is_Channel_A_Interrupt;
    count_reg_next <= count_reg;
    guard1 := '0';
    guard2 := '0';

    CASE is_Channel_A_Interrupt IS
      WHEN IN_I1 =>
        IF A = '1' THEN 
          IF A = B THEN 
            add_temp := resize(count_reg, 33) + to_signed(1, 33);
            IF (add_temp(32) = '0') AND (add_temp(31) /= '0') THEN 
              count_reg_next <= X"7FFFFFFF";
            ELSIF (add_temp(32) = '1') AND (add_temp(31) /= '1') THEN 
              count_reg_next <= X"80000000";
            ELSE 
              count_reg_next <= add_temp(31 DOWNTO 0);
            END IF;
            is_Channel_A_Interrupt_next <= IN_I2;
          ELSIF A /= B THEN 
            sub_temp := resize(count_reg, 33) - to_signed(1, 33);
            IF (sub_temp(32) = '0') AND (sub_temp(31) /= '0') THEN 
              count_reg_next <= X"7FFFFFFF";
            ELSIF (sub_temp(32) = '1') AND (sub_temp(31) /= '1') THEN 
              count_reg_next <= X"80000000";
            ELSE 
              count_reg_next <= sub_temp(31 DOWNTO 0);
            END IF;
            is_Channel_A_Interrupt_next <= IN_I2;
          ELSE 
            guard1 := '1';
          END IF;
        ELSE 
          guard1 := '1';
        END IF;
      WHEN IN_I2 =>
        IF A = '0' THEN 
          IF A = B THEN 
            add_temp_0 := resize(count_reg, 33) + to_signed(1, 33);
            IF (add_temp_0(32) = '0') AND (add_temp_0(31) /= '0') THEN 
              count_reg_next <= X"7FFFFFFF";
            ELSIF (add_temp_0(32) = '1') AND (add_temp_0(31) /= '1') THEN 
              count_reg_next <= X"80000000";
            ELSE 
              count_reg_next <= add_temp_0(31 DOWNTO 0);
            END IF;
            is_Channel_A_Interrupt_next <= IN_I1;
          ELSIF A /= B THEN 
            sub_temp_0 := resize(count_reg, 33) - to_signed(1, 33);
            IF (sub_temp_0(32) = '0') AND (sub_temp_0(31) /= '0') THEN 
              count_reg_next <= X"7FFFFFFF";
            ELSIF (sub_temp_0(32) = '1') AND (sub_temp_0(31) /= '1') THEN 
              count_reg_next <= X"80000000";
            ELSE 
              count_reg_next <= sub_temp_0(31 DOWNTO 0);
            END IF;
            is_Channel_A_Interrupt_next <= IN_I1;
          ELSE 
            guard2 := '1';
          END IF;
        ELSE 
          guard2 := '1';
        END IF;
      WHEN IN_I3 =>
        is_Channel_A_Interrupt_next <= IN_I4;
      WHEN OTHERS => 
        IF enable = '1' THEN 
          count_reg_next <= to_signed(16#00000000#, 32);
          reset_val_temp := reset_1;
          is_Channel_A_Interrupt_next <= IN_I1;
        END IF;
    END CASE;

    IF guard2 = '1' THEN 
      IF enable = '0' THEN 
        is_Channel_A_Interrupt_next <= IN_I3;
      ELSIF reset_1 /= reset_val_temp THEN 
        count_reg_next <= to_signed(16#00000000#, 32);
        reset_val_temp := reset_1;
        is_Channel_A_Interrupt_next <= IN_I2;
      END IF;
    END IF;
    IF guard1 = '1' THEN 
      IF enable = '0' THEN 
        is_Channel_A_Interrupt_next <= IN_I3;
      ELSIF reset_1 /= reset_val_temp THEN 
        count_reg_next <= to_signed(16#00000000#, 32);
        reset_val_temp := reset_1;
        is_Channel_A_Interrupt_next <= IN_I1;
      END IF;
    END IF;
    reset_val_next <= reset_val_temp;
  END PROCESS Channel_A_Interrupt_1_output;

  count_tmp <= count_reg_next;

  count <= std_logic_vector(count_tmp);

END rtl;


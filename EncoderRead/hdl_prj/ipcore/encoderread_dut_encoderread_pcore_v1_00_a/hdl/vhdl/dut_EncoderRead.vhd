-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\EncoderRead\dut_EncoderRead.vhd
-- Created: 2015-02-11 17:56:59
-- 
-- Generated by MATLAB 8.4 and HDL Coder 3.5
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 1
-- Target subsystem base rate: 1
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- count                         ce_out        1
-- led_A                         ce_out        1
-- led_B                         ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dut_EncoderRead
-- Source Path: EncoderRead/dut_EncoderRead
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY dut_EncoderRead IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        A                                 :   IN    std_logic;
        B                                 :   IN    std_logic;
        reset_1                           :   IN    std_logic;
        enable                            :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        count                             :   OUT   std_logic_vector(31 DOWNTO 0);  -- int32
        led_A                             :   OUT   std_logic;
        led_B                             :   OUT   std_logic
        );
END dut_EncoderRead;


ARCHITECTURE rtl OF dut_EncoderRead IS

  -- Component Declarations
  COMPONENT Channel_A_Interrupt
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          A                               :   IN    std_logic;
          B                               :   IN    std_logic;
          reset_1                         :   IN    std_logic;
          enable                          :   IN    std_logic;
          count                           :   OUT   std_logic_vector(31 DOWNTO 0)  -- int32
          );
  END COMPONENT;

  COMPONENT Channel_B_Interrupt
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          A                               :   IN    std_logic;
          B                               :   IN    std_logic;
          reset_1                         :   IN    std_logic;
          enable                          :   IN    std_logic;
          count                           :   OUT   std_logic_vector(31 DOWNTO 0)  -- int32
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Channel_A_Interrupt
    USE ENTITY work.Channel_A_Interrupt(rtl);

  FOR ALL : Channel_B_Interrupt
    USE ENTITY work.Channel_B_Interrupt(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL Unit_Delay_out1                  : std_logic;
  SIGNAL Unit_Delay1_out1                 : std_logic;
  SIGNAL Unit_Delay2_out1                 : std_logic;
  SIGNAL Unit_Delay3_out1                 : std_logic;
  SIGNAL count_1                          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL count_signed                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL count_2                          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL count_signed_1                   : signed(31 DOWNTO 0);  -- int32
  SIGNAL Sum_out1                         : signed(31 DOWNTO 0);  -- int32
  SIGNAL Unit_Delay4_out1                 : signed(31 DOWNTO 0);  -- int32
  SIGNAL Unit_Delay5_out1                 : std_logic;
  SIGNAL Unit_Delay6_out1                 : std_logic;

BEGIN
  u_Channel_A_Interrupt : Channel_A_Interrupt
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              A => Unit_Delay_out1,
              B => Unit_Delay1_out1,
              reset_1 => Unit_Delay2_out1,
              enable => Unit_Delay3_out1,
              count => count_1  -- int32
              );

  u_Channel_B_Interrupt : Channel_B_Interrupt
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              A => Unit_Delay_out1,
              B => Unit_Delay1_out1,
              reset_1 => Unit_Delay2_out1,
              enable => Unit_Delay3_out1,
              count => count_2  -- int32
              );

  enb <= clk_enable;

  Unit_Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay_out1 <= A;
      END IF;
    END IF;
  END PROCESS Unit_Delay_process;

  Unit_Delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay1_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay1_out1 <= B;
      END IF;
    END IF;
  END PROCESS Unit_Delay1_process;

  Unit_Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay2_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay2_out1 <= reset_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay2_process;

  Unit_Delay3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay3_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay3_out1 <= enable;
      END IF;
    END IF;
  END PROCESS Unit_Delay3_process;

  count_signed <= signed(count_1);

  count_signed_1 <= signed(count_2);

  Sum_out1 <= count_signed + count_signed_1;

  Unit_Delay4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay4_out1 <= to_signed(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay4_out1 <= Sum_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay4_process;

  count <= std_logic_vector(Unit_Delay4_out1);

  Unit_Delay5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay5_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay5_out1 <= Unit_Delay_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay5_process;

  Unit_Delay6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay6_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Unit_Delay6_out1 <= Unit_Delay1_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay6_process;

  ce_out <= clk_enable;

  led_A <= Unit_Delay5_out1;

  led_B <= Unit_Delay6_out1;

END rtl;


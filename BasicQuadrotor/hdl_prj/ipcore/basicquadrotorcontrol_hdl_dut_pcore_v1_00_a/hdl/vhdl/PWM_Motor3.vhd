-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\BasicQuadrotorControl\PWM_Motor3.vhd
-- Created: 2015-02-18 16:12:25
-- 
-- Generated by MATLAB 8.4 and HDL Coder 3.5
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: PWM_Motor3
-- Source Path: BasicQuadrotorControl/hdl_dut/PWM_Motor3
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY PWM_Motor3 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        en                                :   IN    std_logic;
        duty                              :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        freq                              :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        dir                               :   IN    std_logic;
        PWM                               :   OUT   std_logic;
        DIR_1                             :   OUT   std_logic
        );
END PWM_Motor3;


ARCHITECTURE rtl OF PWM_Motor3 IS

  -- Component Declarations
  COMPONENT Calculate_f_coeff_block1
    PORT( pwm_freq                        :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          f_coeff                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
          );
  END COMPONENT;

  COMPONENT Chart
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          pwm_enable                      :   IN    std_logic;
          duty                            :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          f_coeff                         :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          PWM                             :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Calculate_f_coeff_block1
    USE ENTITY work.Calculate_f_coeff_block1(rtl);

  FOR ALL : Chart
    USE ENTITY work.Chart(rtl);

  -- Signals
  SIGNAL Calculate_f_coeff_out1           : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_Calculate_f_coeff : Calculate_f_coeff_block1
    PORT MAP( pwm_freq => freq,  -- uint32
              f_coeff => Calculate_f_coeff_out1  -- uint32
              );

  u_Chart : Chart
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              pwm_enable => en,
              duty => duty,  -- uint8
              f_coeff => Calculate_f_coeff_out1,  -- uint32
              PWM => PWM
              );


  DIR_1 <= dir;

END rtl;


-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\PWM_controller\pwm_controller_pwm_controller_pcore_dut.vhd
-- Created: 2014-10-15 17:50:19
-- 
-- Generated by MATLAB 8.3 and HDL Coder 3.4
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: pwm_controller_pwm_controller_pcore_dut
-- Source Path: pwm_controller_pwm_controller_pcore/pwm_controller_pwm_controller_pcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY pwm_controller_pwm_controller_pcore_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        enable                            :   IN    std_logic;  -- ufix1
        duty                              :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        direction                         :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;  -- ufix1
        PWM                               :   OUT   std_logic;  -- ufix1
        DIR                               :   OUT   std_logic  -- ufix1
        );
END pwm_controller_pwm_controller_pcore_dut;


ARCHITECTURE rtl OF pwm_controller_pwm_controller_pcore_dut IS

  -- Component Declarations
  COMPONENT PWM_Controller
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          enable                          :   IN    std_logic;  -- ufix1
          duty                            :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          direction                       :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          PWM                             :   OUT   std_logic;  -- ufix1
          DIR                             :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : PWM_Controller
    USE ENTITY work.PWM_Controller(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL enable_sig                       : std_logic;  -- ufix1
  SIGNAL direction_sig                    : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL PWM_sig                          : std_logic;  -- ufix1
  SIGNAL DIR_sig                          : std_logic;  -- ufix1

BEGIN
  u_PWM_Controller : PWM_Controller
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              enable => enable_sig,  -- ufix1
              duty => duty,  -- ufix8
              direction => direction_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              PWM => PWM_sig,  -- ufix1
              DIR => DIR_sig  -- ufix1
              );

  enable_sig <= enable;

  direction_sig <= direction;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  PWM <= PWM_sig;

  DIR <= DIR_sig;

END rtl;

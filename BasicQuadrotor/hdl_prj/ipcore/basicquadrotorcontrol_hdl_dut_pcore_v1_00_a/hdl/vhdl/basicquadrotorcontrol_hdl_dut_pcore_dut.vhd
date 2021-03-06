-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\BasicQuadrotorControl\basicquadrotorcontrol_hdl_dut_pcore_dut.vhd
-- Created: 2015-02-18 16:31:57
-- 
-- Generated by MATLAB 8.4 and HDL Coder 3.5
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: basicquadrotorcontrol_hdl_dut_pcore_dut
-- Source Path: basicquadrotorcontrol_hdl_dut_pcore/basicquadrotorcontrol_hdl_dut_pcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY basicquadrotorcontrol_hdl_dut_pcore_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        CMD                               :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        CMD_VLD                           :   IN    std_logic;  -- ufix1
        SDO                               :   IN    std_logic;  -- ufix1
        en_motor1                         :   IN    std_logic;  -- ufix1
        duty_motor1                       :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        en_motor2                         :   IN    std_logic;  -- ufix1
        duty_motor2                       :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        en_motor3                         :   IN    std_logic;  -- ufix1
        duty_motor3                       :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        en_motor4                         :   IN    std_logic;  -- ufix1
        duty_motor4                       :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        ce_out                            :   OUT   std_logic;  -- ufix1
        X                                 :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        Y                                 :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        Z                                 :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        XYZ_Valid                         :   OUT   std_logic;  -- ufix1
        CS                                :   OUT   std_logic;  -- ufix1
        SCLK                              :   OUT   std_logic;  -- ufix1
        SDI                               :   OUT   std_logic;  -- ufix1
        PWM_motor1_1                      :   OUT   std_logic;  -- ufix1
        PWM_motor2_1                      :   OUT   std_logic;  -- ufix1
        PWM_motor3_1                      :   OUT   std_logic;  -- ufix1
        PWM_motor4_1                      :   OUT   std_logic  -- ufix1
        );
END basicquadrotorcontrol_hdl_dut_pcore_dut;


ARCHITECTURE rtl OF basicquadrotorcontrol_hdl_dut_pcore_dut IS

  -- Component Declarations
  COMPONENT hdl_dut
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          CMD                             :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          CMD_VLD                         :   IN    std_logic;  -- ufix1
          SDO                             :   IN    std_logic;  -- ufix1
          en_motor1                       :   IN    std_logic;  -- ufix1
          duty_motor1                     :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          en_motor2                       :   IN    std_logic;  -- ufix1
          duty_motor2                     :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          en_motor3                       :   IN    std_logic;  -- ufix1
          duty_motor3                     :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          en_motor4                       :   IN    std_logic;  -- ufix1
          duty_motor4                     :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          ce_out                          :   OUT   std_logic;  -- ufix1
          X                               :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          Y                               :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          Z                               :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
          XYZ_Valid                       :   OUT   std_logic;  -- ufix1
          CS                              :   OUT   std_logic;  -- ufix1
          SCLK                            :   OUT   std_logic;  -- ufix1
          SDI                             :   OUT   std_logic;  -- ufix1
          PWM_motor1_1                    :   OUT   std_logic;  -- ufix1
          PWM_motor2_1                    :   OUT   std_logic;  -- ufix1
          PWM_motor3_1                    :   OUT   std_logic;  -- ufix1
          PWM_motor4_1                    :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : hdl_dut
    USE ENTITY work.hdl_dut(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL CMD_VLD_sig                      : std_logic;  -- ufix1
  SIGNAL SDO_sig                          : std_logic;  -- ufix1
  SIGNAL en_motor1_sig                    : std_logic;  -- ufix1
  SIGNAL en_motor2_sig                    : std_logic;  -- ufix1
  SIGNAL en_motor3_sig                    : std_logic;  -- ufix1
  SIGNAL en_motor4_sig                    : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL X_sig                            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Y_sig                            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Z_sig                            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL XYZ_Valid_sig                    : std_logic;  -- ufix1
  SIGNAL CS_sig                           : std_logic;  -- ufix1
  SIGNAL SCLK_sig                         : std_logic;  -- ufix1
  SIGNAL SDI_sig                          : std_logic;  -- ufix1
  SIGNAL PWM_motor1_1_sig                 : std_logic;  -- ufix1
  SIGNAL PWM_motor2_1_sig                 : std_logic;  -- ufix1
  SIGNAL PWM_motor3_1_sig                 : std_logic;  -- ufix1
  SIGNAL PWM_motor4_1_sig                 : std_logic;  -- ufix1

BEGIN
  u_hdl_dut : hdl_dut
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              CMD => CMD,  -- ufix16
              CMD_VLD => CMD_VLD_sig,  -- ufix1
              SDO => SDO_sig,  -- ufix1
              en_motor1 => en_motor1_sig,  -- ufix1
              duty_motor1 => duty_motor1,  -- ufix8
              en_motor2 => en_motor2_sig,  -- ufix1
              duty_motor2 => duty_motor2,  -- ufix8
              en_motor3 => en_motor3_sig,  -- ufix1
              duty_motor3 => duty_motor3,  -- ufix8
              en_motor4 => en_motor4_sig,  -- ufix1
              duty_motor4 => duty_motor4,  -- ufix8
              ce_out => ce_out_sig,  -- ufix1
              X => X_sig,  -- ufix16
              Y => Y_sig,  -- ufix16
              Z => Z_sig,  -- ufix16
              XYZ_Valid => XYZ_Valid_sig,  -- ufix1
              CS => CS_sig,  -- ufix1
              SCLK => SCLK_sig,  -- ufix1
              SDI => SDI_sig,  -- ufix1
              PWM_motor1_1 => PWM_motor1_1_sig,  -- ufix1
              PWM_motor2_1 => PWM_motor2_1_sig,  -- ufix1
              PWM_motor3_1 => PWM_motor3_1_sig,  -- ufix1
              PWM_motor4_1 => PWM_motor4_1_sig  -- ufix1
              );

  CMD_VLD_sig <= CMD_VLD;

  SDO_sig <= SDO;

  en_motor1_sig <= en_motor1;

  en_motor2_sig <= en_motor2;

  en_motor3_sig <= en_motor3;

  en_motor4_sig <= en_motor4;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  X <= X_sig;

  Y <= Y_sig;

  Z <= Z_sig;

  XYZ_Valid <= XYZ_Valid_sig;

  CS <= CS_sig;

  SCLK <= SCLK_sig;

  SDI <= SDI_sig;

  PWM_motor1_1 <= PWM_motor1_1_sig;

  PWM_motor2_1 <= PWM_motor2_1_sig;

  PWM_motor3_1 <= PWM_motor3_1_sig;

  PWM_motor4_1 <= PWM_motor4_1_sig;

END rtl;


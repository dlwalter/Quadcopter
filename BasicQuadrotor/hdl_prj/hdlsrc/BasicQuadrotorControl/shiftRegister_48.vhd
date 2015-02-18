-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\BasicQuadrotorControl\shiftRegister_48.vhd
-- Created: 2015-02-17 18:38:38
-- 
-- Generated by MATLAB 8.4 and HDL Coder 3.5
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: shiftRegister_48
-- Source Path: BasicQuadrotorControl/hdl_dut/ADXL345_read/XYZ_shiftRegister/shiftRegister_48
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY shiftRegister_48 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        shift                             :   IN    std_logic;
        serial_in                         :   IN    std_logic;
        XYZ                               :   OUT   std_logic_vector(47 DOWNTO 0)  -- ufix48
        );
END shiftRegister_48;


ARCHITECTURE rtl OF shiftRegister_48 IS

  -- Signals
  SIGNAL XYZ_tmp                          : unsigned(47 DOWNTO 0);  -- ufix48
  SIGNAL XYZ_int                          : unsigned(47 DOWNTO 0);  -- ufix48
  SIGNAL XYZ_int_next                     : unsigned(47 DOWNTO 0);  -- ufix48

BEGIN
  shiftRegister_48_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      XYZ_int <= to_unsigned(0, 48);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        XYZ_int <= XYZ_int_next;
      END IF;
    END IF;
  END PROCESS shiftRegister_48_1_process;
  shiftRegister_48_1_output : PROCESS (shift, serial_in, XYZ_int)
    VARIABLE serial_in_int : std_logic;
    VARIABLE c : unsigned(47 DOWNTO 0);
    VARIABLE XYZ_int_temp : unsigned(47 DOWNTO 0);
  BEGIN
    XYZ_int_temp := XYZ_int;
    --%
    --%
    IF shift = '1' THEN 
      serial_in_int := serial_in;
      c := XYZ_int sll 1;
      XYZ_int_temp := c(47 DOWNTO 1) & serial_in_int;
    END IF;
    --%
    XYZ_tmp <= XYZ_int_temp;
    --%
    XYZ_int_next <= XYZ_int_temp;
  END PROCESS shiftRegister_48_1_output;


  XYZ <= std_logic_vector(XYZ_tmp);

END rtl;

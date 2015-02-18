-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\PmodACL_IP_14a\pmodacl_ip_14a_hdl_dut_pcore_addr_decoder.vhd
-- Created: 2015-02-17 15:23:15
-- 
-- Generated by MATLAB 8.4 and HDL Coder 3.5
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: pmodacl_ip_14a_hdl_dut_pcore_addr_decoder
-- Source Path: pmodacl_ip_14a_hdl_dut_pcore/pmodacl_ip_14a_hdl_dut_pcore_axi_lite/pmodacl_ip_14a_hdl_dut_pcore_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY pmodacl_ip_14a_hdl_dut_pcore_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_X                            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        read_Y                            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        read_Z                            :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        read_XYZ_Valid                    :   IN    std_logic;  -- ufix1
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_CMD                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        write_CMD_VLD                     :   OUT   std_logic  -- ufix1
        );
END pmodacl_ip_14a_hdl_dut_pcore_addr_decoder;


ARCHITECTURE rtl OF pmodacl_ip_14a_hdl_dut_pcore_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_X                     : std_logic;  -- ufix1
  SIGNAL read_X_unsigned                  : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL read_Y_unsigned                  : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL read_Z_unsigned                  : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL decode_sel_XYZ_Valid             : std_logic;  -- ufix1
  SIGNAL decode_sel_Z                     : std_logic;  -- ufix1
  SIGNAL decode_sel_Y                     : std_logic;  -- ufix1
  SIGNAL const_z                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_X                       : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL data_in_X                        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_X                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_Y                       : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL data_in_Y                        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Y                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_Z                       : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL data_in_Z                        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Z                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_XYZ_Valid               : std_logic;  -- ufix1
  SIGNAL data_in_XYZ_Valid                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_XYZ_Valid              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL decode_sel_axi_enable            : std_logic;  -- ufix1
  SIGNAL reg_enb_axi_enable               : std_logic;  -- ufix1
  SIGNAL write_reg_axi_enable             : std_logic;  -- ufix1
  SIGNAL data_in_CMD                      : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL decode_sel_CMD                   : std_logic;  -- ufix1
  SIGNAL reg_enb_CMD                      : std_logic;  -- ufix1
  SIGNAL write_reg_CMD                    : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL data_in_CMD_VLD                  : std_logic;  -- ufix1
  SIGNAL decode_sel_CMD_VLD               : std_logic;  -- ufix1
  SIGNAL reg_enb_CMD_VLD                  : std_logic;  -- ufix1
  SIGNAL write_reg_CMD_VLD                : std_logic;  -- ufix1

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_X <= '1' WHEN addr_sel_unsigned = to_unsigned(2#00000001000010#, 14) ELSE
      '0';

  read_X_unsigned <= unsigned(read_X);

  const_1 <= '1';

  enb <= const_1;

  read_Y_unsigned <= unsigned(read_Y);

  read_Z_unsigned <= unsigned(read_Z);

  
  decode_sel_XYZ_Valid <= '1' WHEN addr_sel_unsigned = to_unsigned(2#00000001000101#, 14) ELSE
      '0';

  
  decode_sel_Z <= '1' WHEN addr_sel_unsigned = to_unsigned(2#00000001000100#, 14) ELSE
      '0';

  
  decode_sel_Y <= '1' WHEN addr_sel_unsigned = to_unsigned(2#00000001000011#, 14) ELSE
      '0';

  const_z <= (OTHERS => 'Z');


  reg_X_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_X <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_X <= read_X_unsigned;
      END IF;
    END IF;
  END PROCESS reg_X_process;

  data_in_X <= resize(read_reg_X, 32);

  
  decode_rd_X <= const_z WHEN decode_sel_X = '0' ELSE
      data_in_X;

  reg_Y_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_Y <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_Y <= read_Y_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Y_process;

  data_in_Y <= resize(read_reg_Y, 32);

  
  decode_rd_Y <= decode_rd_X WHEN decode_sel_Y = '0' ELSE
      data_in_Y;

  reg_Z_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_Z <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_Z <= read_Z_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Z_process;

  data_in_Z <= resize(read_reg_Z, 32);

  
  decode_rd_Z <= decode_rd_Y WHEN decode_sel_Z = '0' ELSE
      data_in_Z;

  reg_XYZ_Valid_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_XYZ_Valid <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_XYZ_Valid <= read_XYZ_Valid;
      END IF;
    END IF;
  END PROCESS reg_XYZ_Valid_process;

  data_in_XYZ_Valid <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & read_reg_XYZ_Valid;

  
  decode_rd_XYZ_Valid <= decode_rd_Z WHEN decode_sel_XYZ_Valid = '0' ELSE
      data_in_XYZ_Valid;

  data_read <= std_logic_vector(decode_rd_XYZ_Valid);

  data_write_unsigned <= unsigned(data_write);

  data_in_axi_enable <= data_write_unsigned(0);

  
  decode_sel_axi_enable <= '1' WHEN addr_sel_unsigned = to_unsigned(2#00000000000001#, 14) ELSE
      '0';

  reg_enb_axi_enable <= decode_sel_axi_enable AND wr_enb;

  reg_axi_enable_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_reg_axi_enable <= '1';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_axi_enable = '1' THEN
        write_reg_axi_enable <= data_in_axi_enable;
      END IF;
    END IF;
  END PROCESS reg_axi_enable_process;

  write_axi_enable <= write_reg_axi_enable;

  data_in_CMD <= data_write_unsigned(15 DOWNTO 0);

  
  decode_sel_CMD <= '1' WHEN addr_sel_unsigned = to_unsigned(2#00000001000000#, 14) ELSE
      '0';

  reg_enb_CMD <= decode_sel_CMD AND wr_enb;

  reg_CMD_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_reg_CMD <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_CMD = '1' THEN
        write_reg_CMD <= data_in_CMD;
      END IF;
    END IF;
  END PROCESS reg_CMD_process;

  write_CMD <= std_logic_vector(write_reg_CMD);

  data_in_CMD_VLD <= data_write_unsigned(0);

  
  decode_sel_CMD_VLD <= '1' WHEN addr_sel_unsigned = to_unsigned(2#00000001000001#, 14) ELSE
      '0';

  reg_enb_CMD_VLD <= decode_sel_CMD_VLD AND wr_enb;

  reg_CMD_VLD_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_reg_CMD_VLD <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_CMD_VLD = '1' THEN
        write_reg_CMD_VLD <= data_in_CMD_VLD;
      END IF;
    END IF;
  END PROCESS reg_CMD_VLD_process;

  write_CMD_VLD <= write_reg_CMD_VLD;

END rtl;


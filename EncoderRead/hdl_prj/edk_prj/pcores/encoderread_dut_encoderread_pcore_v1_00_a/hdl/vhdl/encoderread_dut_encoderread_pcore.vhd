-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\EncoderRead\encoderread_dut_encoderread_pcore.vhd
-- Created: 2015-02-11 17:57:03
-- 
-- Generated by MATLAB 8.4 and HDL Coder 3.5
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: -1
-- Target subsystem base rate: -1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: encoderread_dut_encoderread_pcore
-- Source Path: encoderread_dut_encoderread_pcore
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY encoderread_dut_encoderread_pcore IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        PmodJA1                           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        AXI4_Lite_ACLK                    :   IN    std_logic;  -- ufix1
        AXI4_Lite_ARESETN                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_AWADDR                  :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Lite_AWVALID                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_WDATA                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_WSTRB                   :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI4_Lite_WVALID                  :   IN    std_logic;  -- ufix1
        AXI4_Lite_BREADY                  :   IN    std_logic;  -- ufix1
        AXI4_Lite_ARADDR                  :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Lite_ARVALID                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_RREADY                  :   IN    std_logic;  -- ufix1
        GPLEDs                            :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        AXI4_Lite_AWREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_WREADY                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_BRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_BVALID                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_ARREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_RDATA                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_RRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_RVALID                  :   OUT   std_logic  -- ufix1
        );
END encoderread_dut_encoderread_pcore;


ARCHITECTURE rtl OF encoderread_dut_encoderread_pcore IS

  -- Component Declarations
  COMPONENT encoderread_dut_encoderread_pcore_axi_lite
    PORT( reset                           :   IN    std_logic;
          AXI4_Lite_ACLK                  :   IN    std_logic;  -- ufix1
          AXI4_Lite_ARESETN               :   IN    std_logic;  -- ufix1
          AXI4_Lite_AWADDR                :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Lite_AWVALID               :   IN    std_logic;  -- ufix1
          AXI4_Lite_WDATA                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_WSTRB                 :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI4_Lite_WVALID                :   IN    std_logic;  -- ufix1
          AXI4_Lite_BREADY                :   IN    std_logic;  -- ufix1
          AXI4_Lite_ARADDR                :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Lite_ARVALID               :   IN    std_logic;  -- ufix1
          AXI4_Lite_RREADY                :   IN    std_logic;  -- ufix1
          read_count                      :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32
          AXI4_Lite_AWREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_WREADY                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_BRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_BVALID                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_ARREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_RDATA                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_RRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_RVALID                :   OUT   std_logic;  -- ufix1
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_reset                     :   OUT   std_logic;  -- ufix1
          write_enable                    :   OUT   std_logic;  -- ufix1
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT encoderread_dut_encoderread_pcore_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          A                               :   IN    std_logic;  -- ufix1
          B                               :   IN    std_logic;  -- ufix1
          reset_1                         :   IN    std_logic;  -- ufix1
          enable                          :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          count                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32
          led_A                           :   OUT   std_logic;  -- ufix1
          led_B                           :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : encoderread_dut_encoderread_pcore_axi_lite
    USE ENTITY work.encoderread_dut_encoderread_pcore_axi_lite(rtl);

  FOR ALL : encoderread_dut_encoderread_pcore_dut
    USE ENTITY work.encoderread_dut_encoderread_pcore_dut(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL const_zero                       : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL PmodJA1_unsigned                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL PmodJA1_slice                    : std_logic;  -- ufix1
  SIGNAL PmodJA1_slice_1                  : std_logic;  -- ufix1
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL count_sig                        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Lite_BRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_Lite_RDATA_tmp              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Lite_RRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL dut_enable                       : std_logic;  -- ufix1
  SIGNAL reset_1_sig                      : std_logic;  -- ufix1
  SIGNAL enable_sig                       : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL led_A_sig                        : std_logic;  -- ufix1
  SIGNAL led_B_sig                        : std_logic;  -- ufix1
  SIGNAL GPLEDs_tmp                       : unsigned(7 DOWNTO 0);  -- ufix8

BEGIN
  u_encoderread_dut_encoderread_pcore_axi_lite_inst : encoderread_dut_encoderread_pcore_axi_lite
    PORT MAP( reset => reset,
              AXI4_Lite_ACLK => AXI4_Lite_ACLK,  -- ufix1
              AXI4_Lite_ARESETN => AXI4_Lite_ARESETN,  -- ufix1
              AXI4_Lite_AWADDR => AXI4_Lite_AWADDR,  -- ufix16
              AXI4_Lite_AWVALID => AXI4_Lite_AWVALID,  -- ufix1
              AXI4_Lite_WDATA => AXI4_Lite_WDATA,  -- ufix32
              AXI4_Lite_WSTRB => AXI4_Lite_WSTRB,  -- ufix4
              AXI4_Lite_WVALID => AXI4_Lite_WVALID,  -- ufix1
              AXI4_Lite_BREADY => AXI4_Lite_BREADY,  -- ufix1
              AXI4_Lite_ARADDR => AXI4_Lite_ARADDR,  -- ufix16
              AXI4_Lite_ARVALID => AXI4_Lite_ARVALID,  -- ufix1
              AXI4_Lite_RREADY => AXI4_Lite_RREADY,  -- ufix1
              read_count => count_sig,  -- sfix32
              AXI4_Lite_AWREADY => AXI4_Lite_AWREADY,  -- ufix1
              AXI4_Lite_WREADY => AXI4_Lite_WREADY,  -- ufix1
              AXI4_Lite_BRESP => AXI4_Lite_BRESP_tmp,  -- ufix2
              AXI4_Lite_BVALID => AXI4_Lite_BVALID,  -- ufix1
              AXI4_Lite_ARREADY => AXI4_Lite_ARREADY,  -- ufix1
              AXI4_Lite_RDATA => AXI4_Lite_RDATA_tmp,  -- ufix32
              AXI4_Lite_RRESP => AXI4_Lite_RRESP_tmp,  -- ufix2
              AXI4_Lite_RVALID => AXI4_Lite_RVALID,  -- ufix1
              write_axi_enable => dut_enable,  -- ufix1
              write_reset => reset_1_sig,  -- ufix1
              write_enable => enable_sig,  -- ufix1
              reset_internal => reset_internal  -- ufix1
              );

  u_encoderread_dut_encoderread_pcore_dut_inst : encoderread_dut_encoderread_pcore_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              dut_enable => dut_enable,  -- ufix1
              A => PmodJA1_slice,  -- ufix1
              B => PmodJA1_slice_1,  -- ufix1
              reset_1 => reset_1_sig,  -- ufix1
              enable => enable_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              count => count_sig,  -- sfix32
              led_A => led_A_sig,  -- ufix1
              led_B => led_B_sig  -- ufix1
              );

  const_zero <= to_unsigned(2#000000#, 6);

  reset_cm <=  NOT IPCORE_RESETN;

  PmodJA1_unsigned <= unsigned(PmodJA1);

  PmodJA1_slice <= PmodJA1_unsigned(0);

  PmodJA1_slice_1 <= PmodJA1_unsigned(1);

  reset <= reset_cm OR reset_internal;

  GPLEDs_tmp <= const_zero & unsigned'(led_B_sig & led_A_sig);

  GPLEDs <= std_logic_vector(GPLEDs_tmp);

  AXI4_Lite_BRESP <= AXI4_Lite_BRESP_tmp;

  AXI4_Lite_RDATA <= AXI4_Lite_RDATA_tmp;

  AXI4_Lite_RRESP <= AXI4_Lite_RRESP_tmp;

END rtl;


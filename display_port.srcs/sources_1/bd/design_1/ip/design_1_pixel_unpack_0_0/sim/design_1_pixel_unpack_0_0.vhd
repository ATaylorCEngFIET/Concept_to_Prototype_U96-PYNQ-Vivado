-- (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:pixel_unpack:1.0
-- IP Revision: 2003051420

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_pixel_unpack_0_0 IS
  PORT (
    s_axi_AXILiteS_AWADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_AXILiteS_AWVALID : IN STD_LOGIC;
    s_axi_AXILiteS_AWREADY : OUT STD_LOGIC;
    s_axi_AXILiteS_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_AXILiteS_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_AXILiteS_WVALID : IN STD_LOGIC;
    s_axi_AXILiteS_WREADY : OUT STD_LOGIC;
    s_axi_AXILiteS_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_AXILiteS_BVALID : OUT STD_LOGIC;
    s_axi_AXILiteS_BREADY : IN STD_LOGIC;
    s_axi_AXILiteS_ARADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_AXILiteS_ARVALID : IN STD_LOGIC;
    s_axi_AXILiteS_ARREADY : OUT STD_LOGIC;
    s_axi_AXILiteS_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_AXILiteS_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_AXILiteS_RVALID : OUT STD_LOGIC;
    s_axi_AXILiteS_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    control : IN STD_LOGIC;
    ap_rst_n_control : IN STD_LOGIC;
    stream_in_32_TVALID : IN STD_LOGIC;
    stream_in_32_TREADY : OUT STD_LOGIC;
    stream_in_32_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    stream_in_32_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    stream_in_32_TUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    stream_out_24_TVALID : OUT STD_LOGIC;
    stream_out_24_TREADY : IN STD_LOGIC;
    stream_out_24_TDATA : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    stream_out_24_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    stream_out_24_TUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END design_1_pixel_unpack_0_0;

ARCHITECTURE design_1_pixel_unpack_0_0_arch OF design_1_pixel_unpack_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_pixel_unpack_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT pixel_unpack IS
    GENERIC (
      C_S_AXI_AXILITES_ADDR_WIDTH : INTEGER;
      C_S_AXI_AXILITES_DATA_WIDTH : INTEGER
    );
    PORT (
      s_axi_AXILiteS_AWADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_AXILiteS_AWVALID : IN STD_LOGIC;
      s_axi_AXILiteS_AWREADY : OUT STD_LOGIC;
      s_axi_AXILiteS_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_AXILiteS_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_AXILiteS_WVALID : IN STD_LOGIC;
      s_axi_AXILiteS_WREADY : OUT STD_LOGIC;
      s_axi_AXILiteS_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_AXILiteS_BVALID : OUT STD_LOGIC;
      s_axi_AXILiteS_BREADY : IN STD_LOGIC;
      s_axi_AXILiteS_ARADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_AXILiteS_ARVALID : IN STD_LOGIC;
      s_axi_AXILiteS_ARREADY : OUT STD_LOGIC;
      s_axi_AXILiteS_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_AXILiteS_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_AXILiteS_RVALID : OUT STD_LOGIC;
      s_axi_AXILiteS_RREADY : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      control : IN STD_LOGIC;
      ap_rst_n_control : IN STD_LOGIC;
      stream_in_32_TVALID : IN STD_LOGIC;
      stream_in_32_TREADY : OUT STD_LOGIC;
      stream_in_32_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      stream_in_32_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      stream_in_32_TUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      stream_out_24_TVALID : OUT STD_LOGIC;
      stream_out_24_TREADY : IN STD_LOGIC;
      stream_out_24_TDATA : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
      stream_out_24_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      stream_out_24_TUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
  END COMPONENT pixel_unpack;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design_1_pixel_unpack_0_0_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF stream_out_24_TUSER: SIGNAL IS "xilinx.com:interface:axis:1.0 stream_out_24 TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF stream_out_24_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 stream_out_24 TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF stream_out_24_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 stream_out_24 TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF stream_out_24_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 stream_out_24 TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stream_out_24_TVALID: SIGNAL IS "XIL_INTERFACENAME stream_out_24, TDATA_NUM_BYTES 3, TUSER_WIDTH 1, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_1_0_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF stream_out_24_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 stream_out_24 TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF stream_in_32_TUSER: SIGNAL IS "xilinx.com:interface:axis:1.0 stream_in_32 TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF stream_in_32_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 stream_in_32 TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF stream_in_32_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 stream_in_32 TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF stream_in_32_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 stream_in_32 TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stream_in_32_TVALID: SIGNAL IS "XIL_INTERFACENAME stream_in_32, TDATA_NUM_BYTES 4, TUSER_WIDTH 1, LAYERED_METADATA undef, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_1_0_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF stream_in_32_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 stream_in_32 TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n_control: SIGNAL IS "XIL_INTERFACENAME ap_rst_n_control, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n_control: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n_control RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF control: SIGNAL IS "XIL_INTERFACENAME control, ASSOCIATED_BUSIF s_axi_AXILiteS, ASSOCIATED_RESET ap_rst_n_control, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_1_0_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF control: SIGNAL IS "xilinx.com:signal:clock:1.0 control CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF stream_in_32:stream_out_24, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 150000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_1_0_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_AXILiteS_AWADDR: SIGNAL IS "XIL_INTERFACENAME s_axi_AXILiteS, ADDR_WIDTH 5, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 150000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_1_0_clk_out1, NUM_READ_THREADS 1, N" & 
"UM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_AXILiteS_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWADDR";
BEGIN
  U0 : pixel_unpack
    GENERIC MAP (
      C_S_AXI_AXILITES_ADDR_WIDTH => 5,
      C_S_AXI_AXILITES_DATA_WIDTH => 32
    )
    PORT MAP (
      s_axi_AXILiteS_AWADDR => s_axi_AXILiteS_AWADDR,
      s_axi_AXILiteS_AWVALID => s_axi_AXILiteS_AWVALID,
      s_axi_AXILiteS_AWREADY => s_axi_AXILiteS_AWREADY,
      s_axi_AXILiteS_WDATA => s_axi_AXILiteS_WDATA,
      s_axi_AXILiteS_WSTRB => s_axi_AXILiteS_WSTRB,
      s_axi_AXILiteS_WVALID => s_axi_AXILiteS_WVALID,
      s_axi_AXILiteS_WREADY => s_axi_AXILiteS_WREADY,
      s_axi_AXILiteS_BRESP => s_axi_AXILiteS_BRESP,
      s_axi_AXILiteS_BVALID => s_axi_AXILiteS_BVALID,
      s_axi_AXILiteS_BREADY => s_axi_AXILiteS_BREADY,
      s_axi_AXILiteS_ARADDR => s_axi_AXILiteS_ARADDR,
      s_axi_AXILiteS_ARVALID => s_axi_AXILiteS_ARVALID,
      s_axi_AXILiteS_ARREADY => s_axi_AXILiteS_ARREADY,
      s_axi_AXILiteS_RDATA => s_axi_AXILiteS_RDATA,
      s_axi_AXILiteS_RRESP => s_axi_AXILiteS_RRESP,
      s_axi_AXILiteS_RVALID => s_axi_AXILiteS_RVALID,
      s_axi_AXILiteS_RREADY => s_axi_AXILiteS_RREADY,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      control => control,
      ap_rst_n_control => ap_rst_n_control,
      stream_in_32_TVALID => stream_in_32_TVALID,
      stream_in_32_TREADY => stream_in_32_TREADY,
      stream_in_32_TDATA => stream_in_32_TDATA,
      stream_in_32_TLAST => stream_in_32_TLAST,
      stream_in_32_TUSER => stream_in_32_TUSER,
      stream_out_24_TVALID => stream_out_24_TVALID,
      stream_out_24_TREADY => stream_out_24_TREADY,
      stream_out_24_TDATA => stream_out_24_TDATA,
      stream_out_24_TLAST => stream_out_24_TLAST,
      stream_out_24_TUSER => stream_out_24_TUSER
    );
END design_1_pixel_unpack_0_0_arch;

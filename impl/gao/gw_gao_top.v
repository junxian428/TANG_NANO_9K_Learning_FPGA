module gw_gao(
    \xCoord_d[11] ,
    \xCoord_d[10] ,
    \xCoord_d[9] ,
    \xCoord_d[8] ,
    \xCoord_d[7] ,
    \xCoord_d[6] ,
    \xCoord_d[5] ,
    \xCoord_d[4] ,
    \xCoord_d[3] ,
    \xCoord_d[2] ,
    \xCoord_d[1] ,
    \xCoord_d[0] ,
    clk_d,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \xCoord_d[11] ;
input \xCoord_d[10] ;
input \xCoord_d[9] ;
input \xCoord_d[8] ;
input \xCoord_d[7] ;
input \xCoord_d[6] ;
input \xCoord_d[5] ;
input \xCoord_d[4] ;
input \xCoord_d[3] ;
input \xCoord_d[2] ;
input \xCoord_d[1] ;
input \xCoord_d[0] ;
input clk_d;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \xCoord_d[11] ;
wire \xCoord_d[10] ;
wire \xCoord_d[9] ;
wire \xCoord_d[8] ;
wire \xCoord_d[7] ;
wire \xCoord_d[6] ;
wire \xCoord_d[5] ;
wire \xCoord_d[4] ;
wire \xCoord_d[3] ;
wire \xCoord_d[2] ;
wire \xCoord_d[1] ;
wire \xCoord_d[0] ;
wire clk_d;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top_0  u_la0_top(
    .control(control0[9:0]),
    .trig0_i(clk_d),
    .data_i({\xCoord_d[11] ,\xCoord_d[10] ,\xCoord_d[9] ,\xCoord_d[8] ,\xCoord_d[7] ,\xCoord_d[6] ,\xCoord_d[5] ,\xCoord_d[4] ,\xCoord_d[3] ,\xCoord_d[2] ,\xCoord_d[1] ,\xCoord_d[0] }),
    .clk_i(clk_d)
);

endmodule

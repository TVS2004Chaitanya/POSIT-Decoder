
// Generated by Cadence Genus(TM) Synthesis Solution 21.10-p002_1
// Generated on: Nov 20 2024 13:23:18 IST (Nov 20 2024 07:53:18 UTC)

// Verification Directory fv/lzd_8_1_decoder 

module lzd_2_1_3_26(vld, k, in);
  input [1:0] in;
  output vld, k;
  wire [1:0] in;
  wire vld, k;
  NAND2XL g14__2398(.A (in[1]), .B (in[0]), .Y (vld));
  NOR2BX1 g15__5107(.AN (in[1]), .B (in[0]), .Y (k));
endmodule

module lzd_2_1_3_25(vld, k, in);
  input [1:0] in;
  output vld, k;
  wire [1:0] in;
  wire vld, k;
  NAND2XL g14__6260(.A (in[1]), .B (in[0]), .Y (vld));
  NOR2BX1 g15__4319(.AN (in[1]), .B (in[0]), .Y (k));
endmodule

module lzd_8_1(vld, k, in);
  input [7:0] in;
  output vld;
  output [2:0] k;
  wire [7:0] in;
  wire vld;
  wire [2:0] k;
  wire k1, k2, n_0, n_1, n_2, v1, v2;
  assign vld = 1'b0;
  lzd_2_1_3_26 three(v2, k2, in[5:4]);
  lzd_2_1_3_25 two(v1, k1, in[3:2]);
  NAND3X1 g128__8428(.A (n_2), .B (in[6]), .C (n_1), .Y (k[0]));
  AOI33XL g129__5526(.A0 (n_0), .A1 (in[1]), .A2 (k[2]), .B0 (k1), .B1
       (v1), .B2 (k[2]), .Y (n_2));
  OA21X1 g130__6783(.A0 (n_0), .A1 (v2), .B0 (in[6]), .Y (k[1]));
  NOR2BX1 g131__3680(.AN (in[6]), .B (v2), .Y (k[2]));
  NAND2XL g132__1617(.A (v2), .B (k2), .Y (n_1));
  INVX1 g133(.A (v1), .Y (n_0));
endmodule

module lzd_8_1_decoder(sign, regi, expo, frac, allone, allzero, in,
     inf);
  input [7:0] in;
  output sign, expo, allone, allzero, inf;
  output [3:0] regi, frac;
  wire [7:0] in;
  wire sign, expo, allone, allzero, inf;
  wire [3:0] regi, frac;
  wire [7:0] lzd_in;
  wire [2:0] k;
  wire SUB_UNS_OP_n_0, SUB_UNS_OP_n_1, SUB_UNS_OP_n_2, SUB_UNS_OP_n_4,
       SUB_UNS_OP_n_6, SUB_UNS_OP_n_8, SUB_UNS_OP_n_10,
       dec_sub_45_19_n_0;
  wire dec_sub_45_19_n_1, dec_sub_45_19_n_4, n_0, n_1, n_2, n_3, n_4,
       n_5;
  wire n_6, n_7, n_8, n_9, n_10, n_11, n_12, n_13;
  wire n_14, n_15, n_16, n_17, n_18, n_19, n_20, n_21;
  wire n_22, n_23, n_24, n_25, n_28, n_29, n_30, n_31;
  wire n_32, n_33, n_34, n_36, n_37, n_38, n_39, n_40;
  wire n_41, n_42, n_43, vld;
  assign sign = in[7];
  lzd_8_1 l0(vld, k, {1'b1, lzd_in[6:1], 1'b0});
  XNOR2X1 g320__2802(.A (n_34), .B (n_32), .Y (lzd_in[5]));
  XNOR2X1 g321__1705(.A (n_34), .B (n_31), .Y (lzd_in[4]));
  MX2X1 g322__5122(.A (in[4]), .B (n_41), .S0 (in[7]), .Y (n_32));
  MX2X1 g323__8246(.A (in[3]), .B (n_40), .S0 (in[7]), .Y (n_31));
  MX2X1 g324__7098(.A (in[6]), .B (n_43), .S0 (in[7]), .Y (n_34));
  OAI221X1 g377__6131(.A0 (n_12), .A1 (n_21), .B0 (n_11), .B1 (n_20),
       .C0 (n_24), .Y (frac[3]));
  OAI211X1 g378__1881(.A0 (n_11), .A1 (n_21), .B0 (n_25), .C0 (n_7), .Y
       (expo));
  AOI221X1 g379__5115(.A0 (n_33), .A1 (n_17), .B0 (n_32), .B1 (n_14),
       .C0 (n_23), .Y (n_25));
  OAI222XL g380__7482(.A0 (n_9), .A1 (n_16), .B0 (n_11), .B1 (n_15),
       .C0 (n_12), .C1 (n_19), .Y (frac[1]));
  AOI222X1 g381__4733(.A0 (n_37), .A1 (n_18), .B0 (n_32), .B1 (n_17),
       .C0 (n_31), .C1 (n_14), .Y (n_24));
  OAI221X1 g382__6161(.A0 (n_11), .A1 (n_19), .B0 (n_12), .B1 (n_20),
       .C0 (n_22), .Y (frac[2]));
  OAI22XL g383__9315(.A0 (n_10), .A1 (n_19), .B0 (n_9), .B1 (n_20), .Y
       (n_23));
  AOI22XL g384__9945(.A0 (n_31), .A1 (n_17), .B0 (n_37), .B1 (n_14), .Y
       (n_22));
  OAI22XL g385__2883(.A0 (n_11), .A1 (n_16), .B0 (n_12), .B1 (n_15), .Y
       (frac[0]));
  INVX1 g386(.A (n_19), .Y (n_18));
  INVX1 g387(.A (n_17), .Y (n_16));
  INVX1 g388(.A (n_15), .Y (n_14));
  NAND3BXL g389__2346(.AN (k[1]), .B (n_8), .C (k[2]), .Y (n_21));
  NAND3BXL g390__1666(.AN (k[2]), .B (k[0]), .C (k[1]), .Y (n_20));
  NAND3BXL g391__7410(.AN (k[2]), .B (n_8), .C (k[1]), .Y (n_19));
  NOR2BX1 g392__6417(.AN (n_13), .B (k[0]), .Y (n_17));
  NAND2XL g393__5477(.A (k[0]), .B (n_13), .Y (n_15));
  XNOR2X1 g394__2398(.A (n_34), .B (n_29), .Y (regi[2]));
  XNOR2X1 g395__5107(.A (n_34), .B (n_28), .Y (regi[1]));
  XNOR2X1 g396__6260(.A (n_34), .B (n_30), .Y (regi[3]));
  NOR2XL g399__4319(.A (k[2]), .B (k[1]), .Y (n_13));
  INVX1 g400(.A (in[0]), .Y (n_12));
  INVX1 g401(.A (n_36), .Y (n_11));
  INVXL g404(.A (n_31), .Y (n_10));
  INVX1 g405(.A (n_37), .Y (n_9));
  INVX1 g406(.A (k[0]), .Y (n_8));
  NAND4BXL g2__8428(.AN (k[1]), .B (in[0]), .C (k[2]), .D (k[0]), .Y
       (n_7));
  MXI2XL g407__5526(.A (n_8), .B (k[0]), .S0 (n_34), .Y (regi[0]));
  NOR2XL g359__6783(.A (n_2), .B (n_1), .Y (allone));
  NOR3BXL g361__3680(.AN (n_0), .B (in[7]), .C (in[6]), .Y (allzero));
  NOR3XL g362__1617(.A (n_5), .B (in[3]), .C (in[0]), .Y (inf));
  OAI21XL g363__2802(.A0 (n_34), .A1 (n_33), .B0 (n_6), .Y (lzd_in[6]));
  XNOR2X1 g364__1705(.A (n_34), .B (n_37), .Y (lzd_in[3]));
  XNOR2X1 g365__5122(.A (n_34), .B (n_36), .Y (lzd_in[2]));
  NAND2XL g367__8246(.A (n_34), .B (n_33), .Y (n_6));
  NAND4BXL g368__7098(.AN (in[6]), .B (n_4), .C (n_3), .D (in[7]), .Y
       (n_5));
  XNOR2X1 g370__6131(.A (n_34), .B (in[0]), .Y (lzd_in[1]));
  MX2X1 g371__1881(.A (in[1]), .B (n_38), .S0 (in[7]), .Y (n_36));
  MX2X1 g372__5115(.A (in[5]), .B (n_42), .S0 (in[7]), .Y (n_33));
  MX2X1 g373__7482(.A (in[2]), .B (n_39), .S0 (in[7]), .Y (n_37));
  NOR2XL g375__4733(.A (in[5]), .B (in[4]), .Y (n_4));
  NAND2XL g408__6161(.A (n_31), .B (n_32), .Y (n_2));
  NOR2XL g409__9315(.A (in[2]), .B (in[1]), .Y (n_3));
  NAND4BXL g410__9945(.AN (n_6), .B (in[0]), .C (n_36), .D (n_37), .Y
       (n_1));
  NOR4BBX1 g411__2883(.AN (n_3), .BN (n_4), .C (in[0]), .D (in[3]), .Y
       (n_0));
  XNOR2X1 SUB_UNS_OP_g100__2346(.A (SUB_UNS_OP_n_10), .B (in[6]), .Y
       (n_43));
  AOI21XL SUB_UNS_OP_g101__1666(.A0 (in[5]), .A1 (SUB_UNS_OP_n_8), .B0
       (SUB_UNS_OP_n_10), .Y (n_42));
  NOR2XL SUB_UNS_OP_g102__7410(.A (in[5]), .B (SUB_UNS_OP_n_8), .Y
       (SUB_UNS_OP_n_10));
  OA21X1 SUB_UNS_OP_g103__6417(.A0 (SUB_UNS_OP_n_1), .A1
       (SUB_UNS_OP_n_6), .B0 (SUB_UNS_OP_n_8), .Y (n_41));
  NAND2XL SUB_UNS_OP_g104__5477(.A (SUB_UNS_OP_n_1), .B
       (SUB_UNS_OP_n_6), .Y (SUB_UNS_OP_n_8));
  AOI21XL SUB_UNS_OP_g105__2398(.A0 (in[3]), .A1 (SUB_UNS_OP_n_4), .B0
       (SUB_UNS_OP_n_6), .Y (n_40));
  NOR2XL SUB_UNS_OP_g106__5107(.A (in[3]), .B (SUB_UNS_OP_n_4), .Y
       (SUB_UNS_OP_n_6));
  OA21X1 SUB_UNS_OP_g107__6260(.A0 (SUB_UNS_OP_n_0), .A1
       (SUB_UNS_OP_n_2), .B0 (SUB_UNS_OP_n_4), .Y (n_39));
  NAND2XL SUB_UNS_OP_g108__4319(.A (SUB_UNS_OP_n_0), .B
       (SUB_UNS_OP_n_2), .Y (SUB_UNS_OP_n_4));
  AOI21XL SUB_UNS_OP_g109__8428(.A0 (in[1]), .A1 (in[0]), .B0
       (SUB_UNS_OP_n_2), .Y (n_38));
  NOR2XL SUB_UNS_OP_g110__5526(.A (in[1]), .B (in[0]), .Y
       (SUB_UNS_OP_n_2));
  INVX1 SUB_UNS_OP_g111(.A (in[4]), .Y (SUB_UNS_OP_n_1));
  INVX1 SUB_UNS_OP_g112(.A (in[2]), .Y (SUB_UNS_OP_n_0));
  INVX1 dec_sub_45_19_g39(.A (dec_sub_45_19_n_4), .Y (n_29));
  ADDHX1 dec_sub_45_19_g40__6783(.A (dec_sub_45_19_n_0), .B
       (dec_sub_45_19_n_1), .CO (n_30), .S (dec_sub_45_19_n_4));
  AO21X1 dec_sub_45_19_g41__3680(.A0 (k[1]), .A1 (k[0]), .B0
       (dec_sub_45_19_n_1), .Y (n_28));
  NOR2XL dec_sub_45_19_g42__1617(.A (k[1]), .B (k[0]), .Y
       (dec_sub_45_19_n_1));
  INVX1 dec_sub_45_19_g43(.A (k[2]), .Y (dec_sub_45_19_n_0));
endmodule

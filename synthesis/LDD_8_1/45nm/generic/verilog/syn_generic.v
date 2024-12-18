
// Generated by Cadence Genus(TM) Synthesis Solution 21.10-p002_1
// Generated on: Nov 20 2024 13:12:57 IST (Nov 20 2024 07:42:57 UTC)

// Verification Directory fv/ldd_8_1_decoder 

module sub_unsigned_9(A, B, Z);
  input A;
  input [6:0] B;
  output [6:0] Z;
  wire A;
  wire [6:0] B;
  wire [6:0] Z;
  wire n_33, n_39, n_41, n_50, n_51, n_76, n_77, n_78;
  wire n_79, n_80, n_81, n_82, n_83, n_84, n_85, n_86;
  wire n_87;
  assign Z[0] = 1'b0;
  or g76 (n_33, B[1], B[0]);
  or g78 (n_39, n_33, B[2]);
  or g81 (n_50, n_41, B[4]);
  or g89 (n_76, wc, B[5]);
  not gc (wc, n_50);
  or g90 (n_77, n_50, wc0);
  not gc0 (wc0, B[5]);
  nand g91 (Z[5], n_76, n_77);
  or g92 (n_78, wc1, B[6]);
  not gc1 (wc1, n_51);
  or g93 (n_79, n_51, wc2);
  not gc2 (wc2, B[6]);
  nand g94 (Z[6], n_78, n_79);
  or g96 (n_80, wc3, B[4]);
  not gc3 (wc3, n_41);
  or g97 (n_81, n_41, wc4);
  not gc4 (wc4, B[4]);
  nand g98 (Z[4], n_80, n_81);
  or g99 (n_82, wc5, B[3]);
  not gc5 (wc5, n_39);
  or g100 (n_83, n_39, wc6);
  not gc6 (wc6, B[3]);
  nand g101 (Z[3], n_82, n_83);
  or g103 (n_84, wc7, B[2]);
  not gc7 (wc7, n_33);
  or g104 (n_85, n_33, wc8);
  not gc8 (wc8, B[2]);
  nand g105 (Z[2], n_84, n_85);
  or g106 (n_86, wc9, B[0]);
  not gc9 (wc9, B[1]);
  or g107 (n_87, B[1], wc10);
  not gc10 (wc10, B[0]);
  nand g108 (Z[1], n_86, n_87);
  or g109 (n_51, n_50, B[5]);
  or g110 (n_41, n_39, B[3]);
endmodule

module ldd_8_1_decoder(sign, r_out, e, frac, z, inf, in, allone);
  input [7:0] in;
  output sign, z, inf, allone;
  output [3:0] r_out, frac;
  output [0:0] e;
  wire [7:0] in;
  wire sign, z, inf, allone;
  wire [3:0] r_out, frac;
  wire [0:0] e;
  wire [6:0] xin;
  wire [5:0] ldd;
  wire [3:0] r;
  wire UNCONNECTED, n_25, n_26, n_64, n_65, n_66, n_67, n_68;
  wire n_96, n_103, n_104, n_114, n_115, n_144, n_147, n_150;
  wire n_158, n_174, n_179, n_181, n_188, n_189, n_190, n_191;
  wire n_192, n_193, n_294, n_295, n_296, n_297, n_298, n_299;
  wire n_300, n_301, n_302, n_303, n_304, n_305, n_307, n_308;
  wire n_309, n_310, n_311, n_314, n_315, n_316, n_317, n_318;
  wire n_319, n_320, n_321, n_322, n_323, n_324, n_325, n_326;
  wire n_327, n_328, n_329, n_330, n_331, n_332, n_333, n_334;
  wire n_335, n_336, n_337;
  assign sign = in[7];
  sub_unsigned_9 SUB_UNS_OP(.A (1'b0), .B (in[6:0]), .Z ({n_189, n_190,
       n_188, n_191, n_192, n_193, UNCONNECTED}));
  not g139 (z, n_174);
  not g348 (r_out[3], xin[6]);
  or g426 (n_144, n_68, ldd[5]);
  or g478 (n_295, n_150, xin[6]);
  nand g479 (n_296, n_150, xin[6]);
  nand g480 (r_out[1], n_295, n_296);
  nand g481 (n_297, r[2], xin[6]);
  or g482 (n_298, r[2], xin[6]);
  nand g483 (r_out[2], n_297, n_298);
  or g484 (n_299, n_147, xin[6]);
  nand g485 (n_300, n_147, xin[6]);
  nand g486 (r_out[0], n_299, n_300);
  or g487 (r[2], wc11, wc12, n_96);
  not gc12 (wc12, ldd[0]);
  not gc11 (wc11, ldd[1]);
  or g488 (n_301, ldd[1], wc13);
  not gc13 (wc13, in[0]);
  or g489 (e, n_158, wc14);
  not gc14 (wc14, n_301);
  or g490 (n_150, n_96, wc15, wc16);
  not gc16 (wc16, ldd[3]);
  not gc15 (wc15, ldd[2]);
  nand g491 (n_302, ldd[5], xin[3]);
  or g492 (n_303, ldd[2], wc17);
  not gc17 (wc17, in[0]);
  nand g493 (frac[3], n_115, n_114, n_302, n_303);
  nand g494 (n_147, ldd[0], ldd[2], ldd[4]);
  nand g495 (n_96, n_25, n_174, n_26);
  nand g496 (n_304, ldd[5], xin[4]);
  or g497 (n_305, wc18, ldd[2]);
  not gc18 (wc18, xin[1]);
  nand g498 (n_158, n_104, n_103, n_304, n_305);
  or g499 (ldd[1], wc19, n_294);
  not gc19 (wc19, n_65);
  or g500 (n_26, n_64, n_65, wc20, n_294);
  not gc20 (wc20, xin[6]);
  not g501 (allone, n_26);
  or g502 (n_114, wc21, ldd[3]);
  not gc21 (wc21, xin[1]);
  or g503 (ldd[0], wc22, n_294, n_65);
  not gc22 (wc22, n_64);
  nand g504 (n_307, ldd[5], xin[2]);
  or g505 (n_308, wc23, ldd[4]);
  not gc23 (wc23, xin[1]);
  or g506 (n_309, ldd[3], wc24);
  not gc24 (wc24, in[0]);
  nand g507 (frac[2], n_307, n_308, n_309);
  or g508 (n_103, wc25, ldd[3]);
  not gc25 (wc25, xin[2]);
  or g509 (n_115, wc26, ldd[4]);
  not gc26 (wc26, xin[2]);
  nand g510 (n_310, ldd[5], xin[1]);
  or g511 (n_311, ldd[4], wc27);
  not gc27 (wc27, in[0]);
  nand g512 (frac[1], n_310, n_311);
  or g513 (n_294, n_66, n_67, n_144);
  or g514 (n_104, wc28, ldd[4]);
  not gc28 (wc28, xin[3]);
  or g515 (ldd[3], wc29, n_144);
  not gc29 (wc29, n_67);
  or g517 (ldd[4], wc30, ldd[5]);
  not gc30 (wc30, n_68);
  or g520 (n_25, n_179, n_181, wc31, in[3], in[0], in[6]);
  not gc31 (wc31, in[7]);
  not g521 (inf, n_25);
  or g522 (n_314, wc32, xin[1]);
  not gc32 (wc32, in[0]);
  or g523 (n_315, in[0], wc33);
  not gc33 (wc33, xin[1]);
  nand g524 (n_64, n_314, n_315);
  or g525 (n_174, n_181, in[7], in[6], n_179, in[3], in[0]);
  or g526 (n_316, wc34, xin[4]);
  not gc34 (wc34, xin[3]);
  or g527 (n_317, xin[3], wc35);
  not gc35 (wc35, xin[4]);
  nand g528 (n_67, n_316, n_317);
  or g529 (n_318, wc36, xin[2]);
  not gc36 (wc36, xin[1]);
  or g530 (n_319, xin[1], wc37);
  not gc37 (wc37, xin[2]);
  nand g531 (n_65, n_318, n_319);
  or g532 (n_320, wc38, xin[6]);
  not gc38 (wc38, xin[5]);
  or g533 (n_321, xin[5], wc39);
  not gc39 (wc39, xin[6]);
  nand g534 (ldd[5], n_320, n_321);
  or g535 (n_322, wc40, xin[3]);
  not gc40 (wc40, xin[2]);
  or g536 (n_323, xin[2], wc41);
  not gc41 (wc41, xin[3]);
  nand g537 (n_66, n_322, n_323);
  or g538 (n_324, wc42, xin[5]);
  not gc42 (wc42, xin[4]);
  or g539 (n_325, xin[4], wc43);
  not gc43 (wc43, xin[5]);
  nand g540 (n_68, n_324, n_325);
  or g541 (n_326, in[7], wc44);
  not gc44 (wc44, in[1]);
  nand g542 (n_327, in[7], n_193);
  nand g543 (xin[1], n_326, n_327);
  or g544 (n_179, in[2], in[1]);
  or g545 (n_181, in[5], in[4]);
  or g546 (n_328, in[7], wc45);
  not gc45 (wc45, in[2]);
  nand g547 (n_329, in[7], n_192);
  nand g548 (xin[2], n_328, n_329);
  or g549 (n_330, in[7], wc46);
  not gc46 (wc46, in[5]);
  nand g550 (n_331, in[7], n_190);
  nand g551 (xin[5], n_330, n_331);
  or g552 (n_332, in[7], wc47);
  not gc47 (wc47, in[4]);
  nand g553 (n_333, in[7], n_188);
  nand g554 (xin[4], n_332, n_333);
  or g555 (n_334, in[7], wc48);
  not gc48 (wc48, in[3]);
  nand g556 (n_335, in[7], n_191);
  nand g557 (xin[3], n_334, n_335);
  or g558 (n_336, in[7], wc49);
  not gc49 (wc49, in[6]);
  nand g559 (n_337, in[7], n_189);
  nand g560 (xin[6], n_336, n_337);
  and g561 (frac[0], ldd[5], in[0]);
  or g562 (ldd[2], n_144, wc50, n_67);
  not gc50 (wc50, n_66);
endmodule


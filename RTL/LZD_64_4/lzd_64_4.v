module lzd_64_4_decoder(sign, regi, expo, frac, allone, allzero, in,inf);
parameter n = 64;
parameter rs = 7;
parameter es = 4;
parameter fs = n-3-es;

input [n-1:0] in;
output inf;
output reg [rs-1:0] regi;
output reg [es-1:0] expo;
output [fs-1:0] frac;
output allone, allzero;
output sign;

assign sign = in[n-1];

reg [n-2:0] twos_in;
reg [n-1:0] lzd_in; //input of lzd
wire [rs-2:0] k;
wire [rs-1:0] k0;
wire vld;

assign k0[rs-1] = 0;
assign k0[rs-2:0] = k; //lzd's output

//twoscom t0(twos_in, in);
always @(in)
case (in[n-1])
	1'b0: twos_in = in[n-2:0];
	1'b1: twos_in = ~in[n-2:0]+1'b1;
endcase

always @(twos_in)
case (twos_in[n-2])
	1'b1: begin                     //lzd update
		lzd_in[n-1:1] = twos_in;
		lzd_in[0] = 1'b0; //k=1111 when all 0
	      end
	1'b0: begin 
		lzd_in[n-1:1] = ~twos_in;
		lzd_in[0] = 1'b0; //k=1111 when all 1
	      end
endcase

lzd_64_4 l0(vld, k, lzd_in);

always @(twos_in[n-2], k0)//Pos or neg for regime
case (twos_in[n-2])
	1'b0: regi = ~(k0-1);
	1'b1: regi = k0-1;
endcase

assign inf = in[n-1]&(~|in[n-2:0]);
assign allone = &twos_in[n-2:0];
assign allzero = ~|(in[n-1:0]);
//shift s0(expo, frac, twos_in, k);

reg [n-2:0] sh0;

//left_shifter s0(sh0, twos_in, k);

always @(twos_in,k)
case(k)
 0: sh0 = twos_in << 1;
 1: sh0 = twos_in << 2;
 2: sh0 = twos_in << 3;
 3: sh0 = twos_in << 4;
 4: sh0 = twos_in << 5;
 5: sh0 = twos_in << 6;
 6: sh0 = twos_in << 7;
 7: sh0 = twos_in << 8;
 8: sh0 = twos_in << 9;
 9: sh0 = twos_in << 10;
10: sh0 = twos_in << 11;
11: sh0 = twos_in << 12;
12: sh0 = twos_in << 13;
13: sh0 = twos_in << 14;
14: sh0 = twos_in << 15;
15: sh0 = twos_in << 16;
16: sh0 = twos_in << 17;
17: sh0 = twos_in << 18;
18: sh0 = twos_in << 19;
19: sh0 = twos_in << 20;
20: sh0 = twos_in << 21;
21: sh0 = twos_in << 22;
22: sh0 = twos_in << 23;
23: sh0 = twos_in << 24;
24: sh0 = twos_in << 25;
25: sh0 = twos_in << 26;
26: sh0 = twos_in << 27;
27: sh0 = twos_in << 28;
28: sh0 = twos_in << 29;
29: sh0 = twos_in << 30;
30: sh0 = twos_in << 31;
31: sh0 = twos_in << 32;
32: sh0 = twos_in << 33;
33: sh0 = twos_in << 34;
34: sh0 = twos_in << 35;
35: sh0 = twos_in << 36;
36: sh0 = twos_in << 37;
37: sh0 = twos_in << 38;
38: sh0 = twos_in << 39;
39: sh0 = twos_in << 40;
40: sh0 = twos_in << 41;
41: sh0 = twos_in << 42;
42: sh0 = twos_in << 43;
43: sh0 = twos_in << 44;
44: sh0 = twos_in << 45;
45: sh0 = twos_in << 46;
46: sh0 = twos_in << 47;
47: sh0 = twos_in << 48;
48: sh0 = twos_in << 49;
49: sh0 = twos_in << 50;
50: sh0 = twos_in << 51;
51: sh0 = twos_in << 52;
52: sh0 = twos_in << 53;
53: sh0 = twos_in << 54;
54: sh0 = twos_in << 55;
55: sh0 = twos_in << 56;
56: sh0 = twos_in << 57;
57: sh0 = twos_in << 58;
58: sh0 = twos_in << 59;
59: sh0 = twos_in << 60;//Three left
60: sh0 = twos_in << 61;
61: sh0 = twos_in << 62;
62: sh0 = twos_in << 63;
63: sh0 = twos_in << 64;
endcase

always @(twos_in, sh0, k) begin
if (k < 59)
	expo = sh0[62:59];
else if (k == 59) begin
	expo[3] = 0;
	expo[2:0] = sh0[62:60];
	end
else if (k == 60) begin
	expo[3:2] = 0;
	expo[1:0] = sh0[62:61];
	end
else if (k == 61) begin
	expo[3:1] = 0;
	expo[0] = sh0[62];
	end

else
	expo = 0;
end

assign frac = sh0[58:2];

endmodule


module lzd_2_1(vld,k,in);
    input [1:0] in;
    output k,vld;               // lzd update 

    assign vld = ~&in;
    assign k = in[1]&(~in[0]);
endmodule


module lzd_64_4(vld,k,in);
    input [63:0] in;
    output reg[5:0] k;
    output vld;
    
//    wire v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13;
    wire v0[0:31];
    wire v1[0:15];
    wire v2[0:7];
    wire v3[0:3];
    wire v4[0:1];
//    wire k0,k1,k2,k3,k4,k5,k6,k7;
    wire [31:0]k0;
//    reg [1:0] k8,k9,k10,k11;
    reg [1:0] k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16;
//    reg [2:0] k12,k13;
        reg [2:0] k17, k18, k19, k20, k21, k22, k23, k24;
    reg [3:0] k25,k26,k27,k28;
    
    reg [4:0] k29,k30;


        
    lzd_2_1 one(v0[0], k0[0], in[1:0]);
    lzd_2_1 two(v0[1], k0[1], in[3:2]);
    lzd_2_1 three(v0[2], k0[2], in[5:4]);
    lzd_2_1 four(v0[3], k0[3], in[7:6]);
    lzd_2_1 five(v0[4], k0[4], in[9:8]);
    lzd_2_1 six(v0[5], k0[5], in[11:10]);
    lzd_2_1 seven(v0[6], k0[6], in[13:12]);
    lzd_2_1 eight(v0[7], k0[7], in[15:14]);
    lzd_2_1 nine(v0[8], k0[8], in[17:16]);
    lzd_2_1 ten(v0[9], k0[9], in[19:18]);
    lzd_2_1 eleven(v0[10], k0[10], in[21:20]);
    lzd_2_1 twelve(v0[11], k0[11], in[23:22]);
    lzd_2_1 thirteen(v0[12], k0[12], in[25:24]);
    lzd_2_1 fourteen(v0[13], k0[13], in[27:26]);
    lzd_2_1 fifteen(v0[14], k0[14], in[29:28]);
    lzd_2_1 sixteen(v0[15], k0[15], in[31:30]);
    lzd_2_1 seventeen(v0[16], k0[16], in[33:32]);
    lzd_2_1 eighteen(v0[17], k0[17], in[35:34]);
    lzd_2_1 nineteen(v0[18], k0[18], in[37:36]);
    lzd_2_1 twenty(v0[19], k0[19], in[39:38]);
    lzd_2_1 twenty_one(v0[20], k0[20], in[41:40]);
    lzd_2_1 twenty_two(v0[21], k0[21], in[43:42]);
    lzd_2_1 twenty_three(v0[22], k0[22], in[45:44]);
    lzd_2_1 twenty_four(v0[23], k0[23], in[47:46]);
    lzd_2_1 twenty_five(v0[24], k0[24], in[49:48]);
    lzd_2_1 twenty_six(v0[25], k0[25], in[51:50]);
    lzd_2_1 twenty_seven(v0[26], k0[26], in[53:52]);
    lzd_2_1 twenty_eight(v0[27], k0[27], in[55:54]);
    lzd_2_1 twenty_nine(v0[28], k0[28], in[57:56]);
    lzd_2_1 thirty(v0[29], k0[29], in[59:58]);
    lzd_2_1 thirty_one(v0[30], k0[30], in[61:60]);
    lzd_2_1 thirty_two(v0[31], k0[31], in[63:62]);

    
    assign v1[0] = v0[0]|v0[1];
    assign v1[1] = v0[2]|v0[3];
    assign v1[2] = v0[4]|v0[5];
    assign v1[3] = v0[6]|v0[7];
    assign v1[4] = v0[8]|v0[9];
    assign v1[5] = v0[10]|v0[11];
    assign v1[6] = v0[12]|v0[13];
    assign v1[7] = v0[14]|v0[15];
    assign v1[8] = v0[16]|v0[17];
    assign v1[9] = v0[18]|v0[19];
    assign v1[10] = v0[20]|v0[21];
    assign v1[11] = v0[22]|v0[23];
    assign v1[12] = v0[24]|v0[25];
    assign v1[13] = v0[26]|v0[27];
    assign v1[14] = v0[28]|v0[29];
    assign v1[15] = v0[30]|v0[31];
    assign v2[0] = v1[0]|v1[1];
    assign v2[1] = v1[2]|v1[3];
    assign v2[2] = v1[4]|v1[5];
    assign v2[3] = v1[6]|v1[7];
    assign v2[4] = v1[8]|v1[9];
    assign v2[5] = v1[10]|v1[11];
    assign v2[6] = v1[12]|v1[13];
    assign v2[7] = v1[14]|v1[15];
    assign v3[0] = v2[0]|v2[1];
    assign v3[1] = v2[2]|v2[3];
    assign v3[2] = v2[4]|v2[5];
    assign v3[3] = v2[6]|v2[7];
    assign v4[0] = v3[0]|v3[1];
    assign v4[1] = v3[2]|v3[3];
    

    assign vld = v4[0]|v4[1];
    
    always @(*) begin
    case(v0[1])
      1'b1:begin
       k1[1] = 1'b0;
       k1[0] = k0[1];
    end
      1'b0:begin
       k1[0] = k0[0];
       k1[1] = 1'b1;
    end
    endcase
        
    case(v0[3])
        1'b1:begin
       k2[1] = 1'b0;
       k2[0] = k0[3];
    end
      1'b0:begin
       k2[0] = k0[2];
       k2[1] = 1'b1;
    end
    endcase
    
    case(v0[5])
        1'b1:begin
       k3[1] = 1'b0;
       k3[0] = k0[5];
    end
      1'b0:begin
       k3[0] = k0[4];
       k3[1] = 1'b1;
    end
    endcase
        
    case(v0[7])
        1'b1:begin
       k4[1] = 1'b0;
       k4[0] = k0[7];
    end
      1'b0:begin
       k4[0] = k0[6];
       k4[1] = 1'b1;
    end
    endcase
    
    case(v0[9])
      1'b1:begin
       k5[1] = 1'b0;
       k5[0] = k0[9];
    end
      1'b0:begin
       k5[0] = k0[8];
       k5[1] = 1'b1;
    end
    endcase
        
    case(v0[11])
        1'b1:begin
       k6[1] = 1'b0;
       k6[0] = k0[11];
    end
      1'b0:begin
       k6[0] = k0[10];
       k6[1] = 1'b1;
    end
    endcase
    
    case(v0[13])
        1'b1:begin
       k7[1] = 1'b0;
       k7[0] = k0[13];
    end
      1'b0:begin
       k7[0] = k0[12];
       k7[1] = 1'b1;
    end
    endcase
        
    case(v0[15])
        1'b1:begin
       k8[1] = 1'b0;
       k8[0] = k0[15];
    end
      1'b0:begin
       k8[0] = k0[14];
       k8[1] = 1'b1;
    end
    endcase


    case(v0[17])
      1'b1:begin
       k9[1] = 1'b0;
       k9[0] = k0[17];
    end
      1'b0:begin
       k9[0] = k0[16];
       k9[1] = 1'b1;
    end
    endcase
        
    case(v0[19])
        1'b1:begin
       k10[1] = 1'b0;
       k10[0] = k0[19];
    end
      1'b0:begin
       k10[0] = k0[18];
       k10[1] = 1'b1;
    end
    endcase
    
    case(v0[21])
        1'b1:begin
       k11[1] = 1'b0;
       k11[0] = k0[21];
    end
      1'b0:begin
       k11[0] = k0[20];
       k11[1] = 1'b1;
    end
    endcase
        
    case(v0[23])
        1'b1:begin
       k12[1] = 1'b0;
       k12[0] = k0[23];
    end
      1'b0:begin
       k12[0] = k0[22];
       k12[1] = 1'b1;
    end
    endcase
    
    case(v0[25])
      1'b1:begin
       k13[1] = 1'b0;
       k13[0] = k0[25];
    end
      1'b0:begin
       k13[0] = k0[24];
       k13[1] = 1'b1;
    end
    endcase
        
    case(v0[27])
        1'b1:begin
       k14[1] = 1'b0;
       k14[0] = k0[27];
    end
      1'b0:begin
       k14[0] = k0[26];
       k14[1] = 1'b1;
    end
    endcase
    
    case(v0[29])
        1'b1:begin
       k15[1] = 1'b0;
       k15[0] = k0[29];
    end
      1'b0:begin
       k15[0] = k0[28];
       k15[1] = 1'b1;
    end
    endcase
        
    case(v0[31])
        1'b1:begin
       k16[1] = 1'b0;
       k16[0] = k0[31];
    end
      1'b0:begin
       k16[0] = k0[30];
       k16[1] = 1'b1;
    end
    endcase
    
    case(v1[1])
      1'b1:begin
       k17[2] = 1'b0;
       k17[1:0] = k2;
    end
      1'b0:begin
       k17[2] = 1'b1;
       k17[1:0] = k1;
    end
    endcase
        
    case(v1[3])
       1'b1:begin
       k18[2] = 1'b0;
       k18[1:0] = k4;
    end
      1'b0:begin
       k18[2] = 1'b1;
       k18[1:0] = k3;
    end
    endcase
    
    case(v1[5])
      1'b1:begin
       k19[2] = 1'b0;
       k19[1:0] = k6;
    end
      1'b0:begin
       k19[2] = 1'b1;
       k19[1:0] = k5;
    end
    endcase
        
    case(v1[7])
       1'b1:begin
       k20[2] = 1'b0;
       k20[1:0] = k8;
    end
      1'b0:begin
       k20[2] = 1'b1;
       k20[1:0] = k7;
    end
    endcase


    case(v1[9])
      1'b1:begin
       k21[2] = 1'b0;
       k21[1:0] = k10;
    end
      1'b0:begin
       k21[2] = 1'b1;
       k21[1:0] = k9;
    end
    endcase
        
    case(v1[11])
       1'b1:begin
       k22[2] = 1'b0;
       k22[1:0] = k12;
    end
      1'b0:begin
       k22[2] = 1'b1;
       k22[1:0] = k11;
    end
    endcase
    
    case(v1[13])
      1'b1:begin
       k23[2] = 1'b0;
       k23[1:0] = k14;
    end
      1'b0:begin
       k23[2] = 1'b1;
       k23[1:0] = k13;
    end
    endcase
        
    case(v1[15])
       1'b1:begin
       k24[2] = 1'b0;
       k24[1:0] = k16;
    end
      1'b0:begin
       k24[2] = 1'b1;
       k24[1:0] = k15;
    end
    endcase
        
    case(v2[1])
        1'b1:begin
       k25[3] = 1'b0;
       k25[2:0] = k18;
    end
      1'b0:begin
       k25[3] = 1'b1;
       k25[2:0] = k17;
    end
    endcase
    
    case(v2[3])
        1'b1:begin
       k26[3] = 1'b0;
       k26[2:0] = k20;
    end
      1'b0:begin
       k26[3] = 1'b1;
       k26[2:0] = k19;
    end
    endcase

        case(v2[5])
        1'b1:begin
       k27[3] = 1'b0;
       k27[2:0] = k22;
    end
      1'b0:begin
       k27[3] = 1'b1;
       k27[2:0] = k21;
    end
    endcase
    
    case(v2[7])
        1'b1:begin
       k28[3] = 1'b0;
       k28[2:0] = k24;
    end
      1'b0:begin
       k28[3] = 1'b1;
       k28[2:0] = k23;
    end
    endcase
    
    case(v3[1])
        1'b1:begin
       k29[4] = 1'b0;
       k29[3:0] = k26;
    end
      1'b0:begin
       k29[4] = 1'b1;
       k29[3:0] = k25;
    end
    endcase

        case(v3[3])
        1'b1:begin
       k30[4] = 1'b0;
       k30[3:0] = k28;
    end
      1'b0:begin
       k30[4] = 1'b1;
       k30[3:0] = k27;
    end
    endcase

        case(v4[1])
        1'b1:begin
       k[5] = 1'b0;
       k[4:0] = k30;
    end
      1'b0:begin
       k[5] = 1'b1;
       k[4:0] = k29;
    end
    endcase
    
    end  


endmodule


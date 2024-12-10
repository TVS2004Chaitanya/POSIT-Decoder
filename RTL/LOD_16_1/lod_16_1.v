module lod_16_1_decoder(sign, regi, expo, frac, allone, allzero, in,inf);
parameter n = 16;
parameter rs = 5;
parameter es = 1;
parameter fs = n-3-es;

input [n-1:0] in;
output inf;
output reg [rs-1:0] regi;
output expo;
output [fs-1:0] frac;
output allone, allzero;
output sign;

assign sign = in[n-1];

reg [n-2:0] twos_in;
reg [n-1:0] lod_in; //input of LOD
wire [rs-2:0] k;
wire [rs-1:0] k0;
wire vld;

assign k0[rs-1] = 0;
assign k0[rs-2:0] = k; //LOD's output

//twoscom t0(twos_in, in);
always @(in)
case (in[n-1])
	1'b0: twos_in = in[n-2:0];
	1'b1: twos_in = ~in[n-2:0]+1'b1;
endcase

always @(twos_in)
case (twos_in[n-2])
	1'b0: begin 
		lod_in[n-1:1] = twos_in;
		lod_in[0] = 1'b1; //k=1111 when all 0
	      end
	1'b1: begin 
		lod_in[n-1:1] = ~twos_in;
		lod_in[0] = 1'b1; //k=1111 when all 1
	      end
endcase

lod_16_1 l0(vld, k, lod_in);

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
endcase

assign expo = sh0[n-2];

assign frac = sh0[n-3:2];

endmodule

module lod_2_1(vld,k,in);
    input [1:0] in;
    output k,vld;

    assign vld = |in;
    assign k = ~in[1]&in[0];
endmodule

module lod_16_1(vld,k,in);
    input [15:0] in;
    output reg[3:0] k;
    output vld;
    
//    wire v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13;
    wire v0[0:7];
    wire v1[0:3];
    wire v2[0:1];
//    wire k0,k1,k2,k3,k4,k5,k6,k7;
    wire k0[0:7];
//    reg [1:0] k8,k9,k10,k11;
    reg [1:0] k1,k2,k3,k4;
//    reg [2:0] k12,k13;
    reg [2:0] k5,k6;
        
    lod_2_1 one(v0[0],k0[0],in[1:0]);
    lod_2_1 two(v0[1],k0[1],in[3:2]);
    lod_2_1 three(v0[2],k0[2],in[5:4]);
    lod_2_1 four(v0[3],k0[3],in[7:6]);
    lod_2_1 five(v0[4],k0[4],in[9:8]);
    lod_2_1 six(v0[5],k0[5],in[11:10]);
    lod_2_1 seven(v0[6],k0[6],in[13:12]);
    lod_2_1 eight(v0[7],k0[7],in[15:14]);
    
    assign v1[0] = v0[0]|v0[1];
    assign v1[1] = v0[2]|v0[3];
    assign v1[2] = v0[4]|v0[5];
    assign v1[3] = v0[6]|v0[7];
    assign v2[0] = v1[0]|v1[1];
    assign v2[1] = v1[2]|v1[3];
    assign vld = v2[0]|v2[1];
    
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
    
    case(v1[1])
      1'b1:begin
       k5[2] = 1'b0;
       k5[1:0] = k2;
    end
      1'b0:begin
       k5[2] = 1'b1;
       k5[1:0] = k1;
    end
    endcase
        
    case(v1[3])
       1'b1:begin
       k6[2] = 1'b0;
       k6[1:0] = k4;
    end
      1'b0:begin
       k6[2] = 1'b1;
       k6[1:0] = k3;
    end
    endcase
        
    case(v2[1])
        1'b1:begin
       k[3] = 1'b0;
       k[2:0] = k6;
    end
      1'b0:begin
       k[3] = 1'b1;
       k[2:0] = k5;
    end
    endcase
    end
            
endmodule

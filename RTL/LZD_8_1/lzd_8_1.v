module lzd_8_1_decoder(sign, regi, expo, frac, allone, allzero, in,inf);
parameter n = 8;
input [7:0] in;
output inf;
output reg [3:0] regi;
output expo;
output [3:0] frac;
output allone, allzero;
output sign;

assign sign = in[7];

reg [6:0] twos_in;
reg [7:0] lzd_in; //input of lzd
wire [2:0] k;
wire [3:0] k0;
wire vld;

assign k0[3] = 0;
assign k0[2:0] = k; //lzd's output

//twoscom t0(twos_in, in);
always @(in)
case (in[n-1])
	1'b0: twos_in = in[n-2:0];          
	1'b1: twos_in = ~in[n-2:0]+1'b1;
endcase

always @(twos_in)
case (twos_in[6])       //lzd update
	1'b1: begin 
		lzd_in[7:1] = twos_in;
		lzd_in[0] = 1'b0; //k=1111 when all 0
	      end
	1'b0: begin 
		lzd_in[7:1] = ~twos_in;
		lzd_in[0] = 1'b0; //k=1111 when all 1
	      end
endcase

lzd_8_1 l0(vld, k, lzd_in);

always @(twos_in[6], k0)//Pos or neg for regime
case (twos_in[6])
	1'b0: regi = ~(k0-1);
	1'b1: regi = k0-1;
endcase

assign inf = in[n-1]&(~|in[n-2:0]);
assign allone = &twos_in[n-2:0];
assign allzero = ~|(in[n-1:0]);
//shift s0(expo, frac, twos_in, k);

reg [6:0] sh0;

//left_shifter s0(sh0, twos_in, k);

always @(twos_in,k)
case(k)
 0: sh0 = twos_in  << 1;
 1: sh0 = twos_in  << 2;
 2: sh0 = twos_in  << 3;
 3: sh0 = twos_in  << 4;
 4: sh0 = twos_in  << 5;
 5: sh0 = twos_in  << 6;
 6: sh0 = twos_in  << 7;
 7: sh0 = twos_in  << 8;

endcase

assign expo = sh0[6];

assign frac = sh0[5:2];

endmodule

module lzd_2_1(vld,k,in);
    input [1:0] in;
    output k,vld;
                            //lzd update
    assign vld = ~&in;
    assign k = in[1]&(~in[0]);
endmodule

module lzd_8_1(vld,k,in);
    input [7:0] in;
    output reg [2:0] k;
    output vld;
    
    wire v0,v1,v2,v3,v4,v5;
    wire k0,k1,k2,k3;
    reg [1:0] k4,k5;
    
    lzd_2_1 one(v0,k0,in[1:0]);
    lzd_2_1 two(v1,k1,in[3:2]);
    lzd_2_1 three(v2,k2,in[5:4]);
    lzd_2_1 four(v3,k3,in[7:6]);
    assign v4 = v0|v1;
    assign v5 = v2|v3;
    assign vld = v4|v5;
    
    always @(*) begin
    case(v1)
      1'b1:begin
       k4[1] = 1'b0;
       k4[0] = k1;
    end
      1'b0:begin
       k4[0] = k0;
       k4[1] = 1'b1;
    end
    endcase
    
    case(v3)
      1'b1:begin
       k5[1] = 1'b0;
       k5[0] = k3;
    end
      1'b0:begin
       k5[0] = k2;
       k5[1] = 1'b1;
    end
    endcase
    
    case(v5)
      1'b1:begin
       k[2] = 1'b0;
       k[1:0] = k5;
    end
      1'b0:begin
       k[2] = 1'b1;
       k[1:0] = k4;
    end
    endcase
    end
endmodule

module ldd_32_3_decoder(sign,r_out,e,frac,z,inf,in,allone);
parameter n = 32;
parameter es = 3;
parameter rs = 6;//size of regi
parameter fs = n-es-3;//size of frac
parameter ls = n-2;//size of ldd

input [n-1:0] in;

wire [rs-1:0] r;
output [rs-1:0] r_out;
output [es-1:0] e;
output [fs-1:0] frac;
output z, inf, sign,allone;

wire [n-2:0] xin;
wire [ls-1:0] ldd;
wire [n-3:0] dif;
wire [n-4:0] en;
//wire allone;
wire [rs-1:0] oneRe,oneReTemp;
assign oneReTemp = n-2;


wire [(rs+es+fs)*ls-1:0] temp; 
wire [(rs+es+fs)*ls-1:0] out1;
//regi[i] under ldd[j]: outtemp[j+i*ls+(es+fs)*ls]
//expo[i] under ldd[j]: outtemp[j+i*ls+fs*ls]
//frac[i] under ldd[j]: outtemp[j+i*ls]
wire [fs+ls-2:0] frac1;
wire [ls-2:0] zerobus;
assign zerobus = 0;
assign frac1 = {xin[fs-1:0],zerobus};

assign sign = in[n-1];
assign xin = sign?(~(in[n-2:0])+1):in[n-2:0];

genvar i,j;

for (i = 0;i<n-2;i=i+1) begin
        assign dif[i] = ~(xin[i]^xin[i+1]);
    end

for (i = 0;i<n-3;i=i+1) begin
      assign en[i] = &(dif[n-3:i]);
      end

assign ldd[n-3] = ~dif[n-3];
assign ldd[n-4] = dif[n-3]&~dif[n-4];
assign allone = en[0] & xin[n-2];

for (i = 0;i<n-4;i=i+1) begin
      assign ldd[i] = ~dif[i] & en[i+1];
      end
      
for (i = 0; i < ls; i = i + 1) begin//under ldd[i]
      assign temp[i*rs+(es+fs)*ls+rs-1:i*rs+(es+fs)*ls] = ls-1-i;
//    assign temp[i*fs+fs-1:i*fs] = frac1[i+fs-1:i];
//    if(i>=es)  begin
//       assign temp[i*es+fs*ls+es-1:i*es+fs*ls] = xin[i-1:i-es];
//       end
end

//expo:
for (i = es; i < ls; i = i+1) begin
      assign temp[i*es+fs*ls+es-1:i*es+fs*ls] = xin[i-1:i-es];
end
//expo that have no enough bits left
for (i = 0; i < es; i = i+1) begin
for (j = 0; j < i; j = j+1) begin
      assign temp[i*es+fs*ls+j] = xin[j];
end
for (j = i; j < es; j = j+1) begin
      assign temp[i*es+fs*ls+j] = 1'b0;
end
end
//frac:
for (i = 0; i < ls; i = i + 1) begin
      assign temp[i*fs+fs-1:i*fs] = frac1[i+fs-1:i];
end

//switch order for output
for (i = 0; i < rs; i = i + 1) begin
for (j = 0; j < ls; j = j + 1) begin
      assign out1[j+i*ls+(es+fs)*ls] = ~(temp[j*rs+i+(es+fs)*ls] & ldd[j]);
//    if(i<es) begin
//          assign out1[j+i*ls+fs*ls] = ~(temp[j*es+i+fs*ls] & ldd[j]);
//          end
//    if(i<fs) begin
//          assign out1[j+i*ls] = ~(temp[j*fs+i] & ldd[j]);
//          end
      //assign outtemp[j+i*30+870] = temp[j*6+i+870];
end
end
for (i = 0; i < rs; i = i + 1) begin
      assign oneRe[i] = ~(oneReTemp[i] & (allone|z|inf));
end

for (i = 0; i < es; i = i + 1) begin
for (j = 0; j < ls; j = j + 1) begin
      assign out1[j+i*ls+fs*ls] = ~(temp[j*es+i+fs*ls] & ldd[j]);
      //assign outtemp[j+i*30+780] = temp[j*3+i+780];
end
end

for (i = 0; i < fs; i = i + 1) begin
for (j = 0; j < ls; j = j + 1) begin
      assign out1[j+i*ls] = ~(temp[j*fs+i] & ldd[j]);
      //assign outtemp[j+i*30] = temp[j*26+i];
end
end

//frac out:
for (i = 0; i < rs; i = i + 1) begin
      assign r[i] = ~&({out1[ls-1+i*ls+(es+fs)*ls:i*ls+(es+fs)*ls],oneRe[i]});
end
for (i = 0; i < es; i = i + 1) begin
      assign e[i] = ~&(out1[ls-1+i*ls+fs*ls:i*ls+fs*ls]);
end
for (i = 0; i < fs; i = i + 1) begin
      assign frac[i] = ~&(out1[ls-1+i*ls:i*ls]);
end

//always @(in[n-2], tempregi)
//case (in[n-2])
//    1'b1: regi = tempregi;
//    1'b0: regi = ~tempregi;
//endcase
assign r_out = xin[n-2]?r:~(r);
assign z = ~|in;
assign inf = in[n-1] & (~|in[n-2:0]);

endmodule


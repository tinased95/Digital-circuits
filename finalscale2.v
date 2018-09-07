module finalscale(result,cost,number,tedad);
input [0:3]cost;
reg enter,total,clear,reset;
input [0:3]number;
input [0:1]tedad;
reg [0:6]temp1;
reg [0:6]temp2;
reg [0:6]multiply1;
reg be,bn,br,bt;
output [0:20]result;
reg sumfinal[0:20];
integer i;
reg [0:20]sum;
reg cout;
assign enter=be;
  always @(posedge !clear)
  
  begin
    if(enter)begin
  multiply (multiply1,cost,tedad);
  reg8 (reset,!clear,multiply1,temp1);        
  temp2=temp1;
  be=1'b0;
  
end
  if(enter)begin 
  multiply (multiply1,cost,tedad);
  reg8 (reset,!clear,multiply1,temp1); 
    be=1'b0;

end
  for(i=0;!temp2[i];i=i+1)
  FA (sum[i],cout,temp1[i],temp2[i]); 
end

assign enter=be;//
assign number=bn;
assign reset=br;
assign total=bt;//

 // always @(posedge clk)
 // begin
   // if(enter)
      
    
  //end


module reg8 (reset, CLK, D, Q);
input reset;
input CLK;
input [7:0] D;
output [7:0] Q;
reg [7:0] Q; 
always @(posedge CLK)
if (reset)
Q = 0;
else
Q = D;
endmodule // reg8

module HA(sout,cout,a,b);
output sout,cout;
input a,b;
assign sout=a^b;
assign cout=(a&b);
endmodule
module FA(sout,cout,a,b,cin);
output sout,cout;
input a,b,cin;
assign sout=(a^b^cin);
assign cout=((a&b)|(a&cin)|(b&cin));
endmodule
module multiply(product,inp1,inp2);
output [7:0]product;
input [3:0]inp1;
input [3:0]inp2;
assign product[0]=(inp1[0]&inp2[0]);
wire x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17;
HA HA1(product[1],x1,(inp1[1]&inp2[0]),(inp1[0]&inp2[1]));
FA FA1(x2,x3,inp1[1]&inp2[1],(inp1[0]&inp2[2]),x1);
FA FA2(x4,x5,(inp1[1]&inp2[2]),(inp1[0]&inp2[3]),x3);
HA HA2(x6,x7,(inp1[1]&inp2[3]),x5);
HA HA3(product[2],x15,x2,(inp1[2]&inp2[0]));
FA FA5(x14,x16,x4,(inp1[2]&inp2[1]),x15);
FA FA4(x13,x17,x6,(inp1[2]&inp2[2]),x16);
FA FA3(x9,x8,x7,(inp1[2]&inp2[3]),x17);
HA HA4(product[3],x12,x14,(inp1[3]&inp2[0]));
FA FA8(product[4],x11,x13,(inp1[3]&inp2[1]),x12);
FA FA7(product[5],x10,x9,(inp1[3]&inp2[2]),x11);
FA FA6(product[6],product[7],x8,(inp1[3]&inp2[3]),x10);
endmodule
endmodule

//testbench
module finalscale1;
  reg [0:20]sum;
  reg [0:20]final;
  reg [0:20]result;
  reg [0:3]cost;
  wire enter,number,total,clear,reset,clk,cout;
  reg [0:3]tedad;
  reg [0:6]temp1;
  reg [0:6]temp2;
  reg [0:6]multiply1;
  reg be,bn,br,bt;
  integer i;
  finalscale fs(result,cost,enter,number,total,clear,tedad,reset,clk,cost1,tedad1);
  always @(enter)
  begin
    cost=4'd2500;
    tedad=2'd02;
    #100
    cost=4'd1000;
    tedad=2'd02;
    clear=1'b0;
  end
 
endmodule

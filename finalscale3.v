module finalscale(result,cost,number,tedad);
input [0:3]cost;
reg enter,total,clear,reset,clk;
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
always @(posedge clk)
begin
  if(enter)begin//state 0
    temp1=cost;
    if(number)//state 1
    begin
      temp2=tedad;
      if(enter)//state 0
        temp1=cost;
        if(total)begin
          result=sum;
          if(clear)
            temp1=cost;/////
        end
      end
    end
      
        
end  
  

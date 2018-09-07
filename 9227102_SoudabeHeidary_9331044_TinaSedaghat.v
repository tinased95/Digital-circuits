// module convert(clk,khroji,vorodi);
  //reg [0:9]w;
  //wire[0:3]q;
  //input [0:9]vorodi;
//input clk;
//output [0:3]khroji;
//assign w=vorodi;
//assign q=khroji;

//always @(posedge clk)
//begin 

//if (vorodi==10'b0000000000)
//$display ("Error");
// khroji=4'b0000;
//if(vorodi=10'b0000000001)
//khroji=4'b0000;
//if(vorodi=10'b0000000010) 
//khroji=4'b0001;
//if(vorodi=10'b0000000100)
//khroji=4'b0010;
//if(vorodi=10'b0000001000)
//khroji=4'b0011;
//if(vorodi=10'b0000010000)
//khroji=4'b0100;
//if(vorodi=10'b0000100000)
//khroji=4'b0101;
//if(vorodi=10'b0001000000)
//khroji=4'b0110;
//if(vorodi=10'b0010000000)
//khroji=4'b0111;
//if(vorodi=10'b0100000000)
//khroji=4'b1000;
//if(vorodi=10'b1000000000)
//khroji=4'b1001;
 //khroji=khroji*1111101000///////////////////////////////
//end


  
  






module mine(clk , clear, sum ,total,temp2, enter,temp1,number,cost , tedad,w);
  input clk,clear,enter,total,number;
  input [0:10]temp1;
  input [0:10]temp2;
  reg[0:10] sum_r;
  output[0:10] sum;
  integer state_counter;
  output reg [0:4]cost;
  output reg [0:2]tedad;
  reg be,bn,bt,bc;///////
  output [0:20]w;
 assign enter=be;//////
 assign number=bn;
   assign total=bt;
  assign clear=bc;
  assign w=temp1*temp2;
 //wire x,y;/////////////////////////////////////////////////////////////////
  //assign sum=sum_r;
  initial begin
    state_counter = 0;
    sum_r = 10'b0000000000;
    
  end
  
  always @(posedge clk)
  begin 
    if( clear)
      begin 
        sum_r = 10'b0000000000;
        state_counter = 0;
        
        end
      else
        begin
          case (state_counter)
            0:
           begin
             if(enter)begin
             state_counter=state_counter+1;
             $display("%d temp1 go to cost" , state_counter);
             $display("%d" , sum_r);
              cost=temp1;
              end
              end
             
            1:
            if(number)
              begin
                state_counter=state_counter+1;
              $display("%d" , state_counter);
              $display("temp2 rikht tu tedad");
              $display("%d" , sum_r);
                tedad=temp2;
          
              
                //sum_r=sum_r+temp2*temp1;
                end 
            
      2:
      begin 
      sum_r=sum_r+w;
       state_counter=state_counter+1;
              $display("%d" , state_counter);
    end
      
      3: if(total)
      begin 
        $display("total ro zadim");
        $display("%d",sum);
        $display("%d" , sum_r);
        $display("%d 111" , state_counter);
         state_counter=state_counter+1;
       //if(enter)
       // begin
          //state_counter=0;
         // end
        
        end
      
      
       4: if (!total)
       begin
      state_counter=0;
       $display("%d",sum);
        $display("%d" , sum_r);
   end
        
        
       
      default:$display ("ERROR"); 
      endcase 
     
      end//alwys
       
   end//else
   assign sum=sum_r;
endmodule



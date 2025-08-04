`timescale 1ps/1ps
`include "res.v"
module tb ();
    reg clk;
    reg rst;
    reg  [2:0] data_in;
    reg mode;
    reg valid;
   wire parity_ok;

par u1(.clk(clk),
        .rst(rst),
        .data_in(data_in),
        .mode(mode),
        .valid(valid),
        .parity_ok(parity_ok)
    );
    initial
 begin
        clk = 0;
        forever #5 clk = ~clk; 
 end
  
    initial 
begin
   
        
        rst =0;
        data_in =0;
        mode=0;
        valid = 1;
        #10;
        rst =1;
        data_in =0;
        mode=1;
        valid = 0;
        #10;
  rst =0;
        data_in =1;
        mode=0;
        valid = 0;
        #10;
  rst =1;
        data_in =1;
        mode=1;
        valid = 1;
        #10;
  rst =0;
        data_in =2;
        mode=0;
        valid = 0;
        #10;
  rst =0;
        data_in =2;
        mode=1;
        valid = 1;
        #10;
  rst = 0;
        data_in =3;
        mode=0;
        valid = 1;
        #10;
  rst = 0;
        data_in =3;
        mode=1;
        valid = 0;
        #10;
  rst =1;
        data_in =4;
        mode=0;
        valid = 1;  
        #10;
    rst =1;
        data_in =4;
        mode=1;
        valid = 0;
        #10;
    rst =0;
        data_in =5;
        mode=0;
        valid = 1;
        #10;
    rst =0;
        data_in =5;
        mode=1;
        valid = 1;
        #10;
    rst =0;
        data_in =6;
        mode=0;
        valid = 1;
        #10;
    rst =1;
        data_in =6;
        mode=1;
        valid = 1;
        #10;
    rst =1;
        data_in =7;
        mode=0;
        valid = 0;
        #10;
    rst =1;
        data_in =7;
        mode=1;
        valid = 1;
        #10;
    rst =0;
        data_in =8;
        mode=0;
        valid = 1;
        #10;
    rst =0;
        data_in =8;
        mode=1;
        valid = 0;
        #10;
                $finish;        

end

    initial begin
        $dumpfile("parity_checker_tb.vcd");
        $dumpvars(0, tb);
    end 




initial begin
  $monitor("$time =%0t,clk =  %b,rst=%b,data_in=%b,mode = %b, valid = %b,  parity_ok = %b",$time,clk,rst,data_in,mode,valid,parity_ok);
  end
    
endmodule

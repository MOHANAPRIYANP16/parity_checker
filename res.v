module par (input clk,
input rst,
input [2:0]data_in,
input mode,
input valid,
output reg parity_ok);

parameter even_state = 0;
parameter odd_state = 1'b1;


reg state;
integer i;

always@(posedge clk or posedge rst )
begin
    if(rst)
 begin
        state<= even_state;
        parity_ok <= 1'b0;
 end
    else if(valid) 
    begin
        
        state = even_state; 
        for ( i=0 ;i<4 ; i++ ) 
        begin
            if(data_in[i]) 
                state = ~state ;
        end
                
        
       
        if(mode)
        begin
            case (state)
             even_state: parity_ok <= 0;
             odd_state: parity_ok <= 1'b1; 
             default: parity_ok <= 0; 
            endcase
             
        end 

             else 
        begin
                case (state)
             even_state: parity_ok <= 1'b1;
             odd_state: parity_ok <= 0; 
             default: parity_ok <= 0; 
            endcase
        end
    end
    else
    begin
        parity_ok <= 1'b0; 
    end
   
end
endmodule 






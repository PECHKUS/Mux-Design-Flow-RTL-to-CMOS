module mux2to1 (
    input [1:0] in, 
    input sel,    
    output out
);

 
    wire S_not;  
    wire T1, T2; 
    
    nand N_S (S_not, sel, sel); 
    
    nand N1 (T1, S_not, in[0]); 
    
    nand N2 (T2, sel, in[1]);
    
    nand N_OUT (out, T1, T2); 

endmodule

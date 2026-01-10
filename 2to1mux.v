`timescale 1ns/1ps

module mux2to1 (
    input  I0,
    input  I1,
    input  S,
    output Out
);

    wire S_bar;

    
	not (S_bar, S);  // inverter for select

    // Pass transistor logic
	tranif0 T0 (Out, I0, S);     // when S = 0 → pass I0
	tranif1 T1 (Out, I1, S);     // when S = 1 → pass I1

endmodule

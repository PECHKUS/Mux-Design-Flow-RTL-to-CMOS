

`timescale 1ns/1ps

module muxtest;

    reg  [15:0] A;
    reg  [3:0]  S;
    wire F;

    integer i;

    mux16to1 M (.in(A), .sel(S), .out(F));

    initial begin
        $dumpfile("mux16to1_ptl.vcd");
        $dumpvars(0, muxtest);

        $display("Time | A | S | F");

        // 1st input pattern
        A = 16'h3F0A;
        for (i = 0; i < 16; i = i + 1) begin
            S = i;
            #10;
        end

        // second input pattern
        A = 16'hA5A5;
        for (i = 0; i < 16; i = i + 1) begin
            S = i;
            #10;
        end

        $finish;
    end

    // Detect floating output (important for PTL)
    always @(*) begin
        if (F === 1'bz)
            $display("WARNING: Output floating at time %0t", $time);
    end

endmodule

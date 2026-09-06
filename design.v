module signed_unsigned_comparator (
    input  [7:0] A,
    input  [7:0] B,
    input        signed_mode,

    output reg   greater,
    output reg   equal,
    output reg   less
);

always @(*) begin

    greater = 0;
    equal   = 0;
    less    = 0;

    if (signed_mode == 1'b0) begin

        // Unsigned comparison
        if (A > B)
            greater = 1;
        else if (A == B)
            equal = 1;
        else
            less = 1;

    end

    else begin

        // Signed comparison
        if ($signed(A) > $signed(B))
            greater = 1;
        else if ($signed(A) == $signed(B))
            equal = 1;
        else
            less = 1;

    end

end

endmodule
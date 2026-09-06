module tb_signed_unsigned_comparator;

reg [7:0] A;
reg [7:0] B;
reg       signed_mode;

wire greater;
wire equal;
wire less;

signed_unsigned_comparator DUT (
    .A(A),
    .B(B),
    .signed_mode(signed_mode),
    .greater(greater),
    .equal(equal),
    .less(less)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_signed_unsigned_comparator);

    $monitor("A=%b B=%b MODE=%b GREATER=%b EQUAL=%b LESS=%b",
             A, B, signed_mode, greater, equal, less);

    // Unsigned: 200 > 100
    A = 8'd200;
    B = 8'd100;
    signed_mode = 0;
    #10;

    // Signed: -56 < 100
    A = 8'd200;
    B = 8'd100;
    signed_mode = 1;
    #10;

    // Equal
    A = 8'd50;
    B = 8'd50;
    signed_mode = 0;
    #10;

    // Signed: -1 < 1
    A = 8'b11111111;
    B = 8'b00000001;
    signed_mode = 1;
    #10;

    $finish;

end

endmodule
module counter
#(
parameter N         = 5,
parameter c_clkfreq = 12_000_000
)
(
input clk,
output [N-1:0] count_o
);

reg [N-1:0] count = 0;
reg [$clog2(c_clkfreq)-1:0] timer = 0;

always @(posedge clk) begin
    if (timer == c_clkfreq-1) begin
        timer <= 0;
        count <= count + 1;
    end else begin
        timer <= timer + 1;
    end
end

assign count_o = count;

endmodule
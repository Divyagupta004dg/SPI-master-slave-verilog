`timescale 1ns/1ps

module tb_spi_master;

    logic clk;
    logic rst;
    logic start;
    logic [7:0] tx_data;

    wire mosi;
    wire sclk;
    wire cs;
    wire done;

    // DEBUG WIRES
    wire [1:0] dbg_state;
    wire [2:0] dbg_bit_cnt;
    wire [7:0] dbg_shift_reg;

    // DUT
    spi_master dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .tx_data(tx_data),

        .mosi(mosi),
        .sclk(sclk),
        .cs(cs),
        .done(done),

        // DEBUG CONNECTIONS
        .dbg_state(dbg_state),
        .dbg_bit_cnt(dbg_bit_cnt),
        .dbg_shift_reg(dbg_shift_reg)
    );

    // 100 MHz clock
    always #5 clk = ~clk;

    initial begin
        clk     = 0;
        rst     = 1;
        start   = 0;
        tx_data = 8'hA5;

        #30;
        rst = 0;

        #20;
        start = 1;
        #40;
        start = 0;

        wait(done);

        #100;
        $finish;
    end

endmodule

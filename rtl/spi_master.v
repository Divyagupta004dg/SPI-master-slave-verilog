module spi_master (
    input  wire        clk,
    input  wire        rst,
    input  wire        start,
    input  wire [7:0]  tx_data,
    output reg         mosi,
    output reg         sclk,
    output reg         cs,
    output reg         done
);

    // FSM state encoding
    typedef enum logic [1:0] {
        IDLE     = 2'b00,
        LOAD     = 2'b01,
        TRANSFER = 2'b10,
        DONE     = 2'b11
    } state_t;

    state_t state;

endmodule

module spi_master (
    input  wire        clk,
    input  wire        rst,
    input  wire        start,
    input  wire [7:0]  tx_data,

    output reg         mosi,
    output reg         sclk,
    output reg         cs,
    output reg         done,

    // DEBUG PORTS
    output logic [1:0] dbg_state,
    output logic [2:0] dbg_bit_cnt,
    output logic [7:0] dbg_shift_reg
);

    typedef enum logic [1:0] {
        IDLE     = 2'b00,
        LOAD     = 2'b01,
        TRANSFER = 2'b10,
        DONE_ST  = 2'b11
    } state_t;

    state_t current_state, next_state;

    logic [2:0] bit_cnt;
    logic [7:0] shift_reg;
    logic [2:0] clk_div;

    // FSM state register
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // FSM next-state logic
    always_comb begin
        next_state = current_state;
        case (current_state)
            IDLE:     if (start)           next_state = LOAD;
            LOAD:                          next_state = TRANSFER;
            TRANSFER: if (bit_cnt == 3'd7) next_state = DONE_ST;
            DONE_ST:                       next_state = IDLE;
            default:                       next_state = IDLE;
        endcase
    end

    // CS & DONE
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            cs   <= 1'b1;
            done <= 1'b0;
        end else begin
            case (current_state)
                IDLE: begin cs <= 1; done <= 0; end
                LOAD, TRANSFER: begin cs <= 0; done <= 0; end
                DONE_ST: begin cs <= 1; done <= 1; end
            endcase
        end
    end

    // SPI clock divider
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            clk_div <= 0;
            sclk    <= 0;
        end else if (current_state == TRANSFER) begin
            clk_div <= clk_div + 1;
            if (clk_div == 3'd3) begin
                sclk    <= ~sclk;
                clk_div <= 0;
            end
        end else begin
            clk_div <= 0;
            sclk    <= 0;
        end
    end

    // Shift register & bit counter
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 0;
            bit_cnt   <= 0;
        end else begin
            case (current_state)
                LOAD: begin
                    shift_reg <= tx_data;
                    bit_cnt   <= 0;
                end
                TRANSFER: begin
                    if (clk_div == 3'd3 && sclk == 0) begin
                        shift_reg <= {shift_reg[6:0],1'b0};
                        bit_cnt   <= bit_cnt + 1;
                    end
                end
            endcase
        end
    end

    assign mosi = shift_reg[7];

    // Debug outputs
    assign dbg_state     = current_state;
    assign dbg_bit_cnt   = bit_cnt;
    assign dbg_shift_reg = shift_reg;

endmodule

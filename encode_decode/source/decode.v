module decode(
    input clk,
    input in,
    output reg [1:0] ready,
    output reg [3:0] out
);
    reg [2:0] state;
    reg [6:0] ham;
    wire [2:0] test;


    assign test[0] = ham[0] ^ ham[1] ^ ham[2] ^ ham[4];
    assign test[1] = ham[0] ^ ham[1] ^ ham[3] ^ ham[5];
    assign test[2] = ham[0] ^ ham[2] ^ ham[3] ^ in;

    initial 
    begin
        ready = 0;
        out = 0;
        state = 0;
        ham = 0;
    end
    
    always @(posedge clk)
    begin
        case (state)
            0:
            begin
                ready <= 0;
                if (in == 0)
                begin
                    state <= 0;
                end
                else 
                begin
                    state <= 1;
                end
            end
            1:
            begin
                ready <= 1;
                ham[0] <= in;
                state <= 2;
            end
            2:
            begin
                ham[1] <= in;
                state <= 3;
            end
            3:
            begin
                ham[2] <= in;
                state <= 4;
            end
            4:
            begin
                ham[3] <= in;
                state <= 5;
            end
            5:
            begin
                ham[4] <= in;
                state <= 6;
            end
            6:
            begin
                ham[5] <= in;
                state <= 7;
            end
            7:
            begin
                ham[6] <= in;
                case (test)
                    0:
                    begin
                        ready <= 3;
                        out[3:0] <= ham[3:0];
                    end
                    1:
                    begin
                        ready <= 2;
                        out[3:0] <= ham[3:0];
                    end
                    2:
                    begin
                        ready <= 2;
                        out[3:0] <= ham[3:0];
                    end
                    3:
                    begin
                        ready <= 2;
                        out[3:2] <= ham[3:2];
                        out[1] <= ~ham[1];
                        out[0] <= ham[0];
                    end
                    4:
                    begin
                        ready <= 2;
                        out[3:0] <= ham[3:0];
                    end
                    5:
                    begin
                        ready <= 2;
                        out[3] <= ham[3];
                        out[2] <= ~ham[2];
                        out[1:0] <= ham[1:0];
                    end
                    6:
                    begin
                        ready <= 2;
                        out[3] <= ~ham[3];
                        out[2:0] <= ham[2:0];
                    end
                    7:
                    begin
                        ready <= 2;
                        out[3:1] <= ham[3:1];
                        out[0] <= ~ham[0];
                    end
                endcase
                state <= 0;
            end
        endcase
    end
endmodule
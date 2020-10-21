module encode(
    input clk, 
    input [3:0] in, 
    output reg out
);

    reg [2:0] count;
    reg [3:0] inp;

    initial 
    begin
        count <= 0;
    end

    always @(posedge clk) 
    begin
        case (count)
            0:
            begin
                out <= 1;
                inp <= in;
                count <= count + 1;
            end
            1:
            begin
                out <= inp[0];
                count <= count + 1;
            end
            2:
            begin
                out <= inp[1];
                count <= count + 1;
            end
            3:
            begin
                out <= inp[2];
                count <= count + 1;
            end
            4:
            begin
                out <= inp[3];
                count <= count + 1;
            end
            5:
            begin
                out <= inp[0] ^ inp[1] ^ inp[2];
                count <= count + 1;
            end
            6:
            begin
                out <= inp[0] ^ inp[1] ^ inp[3];
                count <= count + 1;
            end
            7:
            begin
                out <= inp[0] ^ inp[2] ^ inp[3];
                count <= 0;
            end
        endcase 
    end

endmodule
`timescale 1ns/1ns

module testsig;
    reg testclk;
    reg [3:0] testin;
    reg [3:0] counter;
    initial 
    begin
        testin <= 0;
        testclk <= 0;
        counter <= 0;
    end

    always #10
    begin
        testclk = ~testclk;
        if (counter == 0)
        begin
            testin <= testin + 1;
            counter <= counter + 1;
        end
        else 
        begin
            counter <= counter + 1;
        end
    end
    
    encode en(.clk(testclk), .in(testin));
endmodule
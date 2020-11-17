module FSKSystemTb;
  
  reg clk;
  reg[3:0] inputData;
  wire wr;
  wire[3:0] outputData;
  
  FSKSystem FSKSystemTest(inputData, outputData, clk, wr);
  
  always
    begin
      #5 clk <= ~clk;
    end
  
  initial
    begin
      clk <= 1'b0;
      inputData <= 4'b0101;
    end
  
endmodule

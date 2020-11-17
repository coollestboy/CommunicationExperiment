module FSKSystem(inputData, outputData, clk, wr);
  
  input clk;
  input[3:0] inputData;
  output wr;
  output[3:0] outputData;
  
  wire codeClk;
  wire DatatoModulate;
  wire SignaltoTrans;
  wire SignaltoDemodulate;
  wire DatatoDecode;

  codingClk codingClkTest(clk, codeClk);
  encode encodeTest(codeClk,inputData, DatatoModulate);
  modulate modulateTest(DatatoModulate, SignaltoTrans, clk);
  
  assign SignaltoDemodulate = SignaltoTrans;
  
  demodulate demodulateTest(SignaltoDemodulate, DatatoDecode, clk);
  decode decodeTest(codeClk, DatatoDecode, wr ,outputData, );
  
endmodule

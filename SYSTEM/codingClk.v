module codingClk(clk, codeClk);
  
  input clk;
  output reg codeClk;
  
  reg[4:0] count;
  
  initial
    begin
      count <= 5'b00000;
      codeClk <= 1'b0;
    end
  
  always @(posedge clk)
    begin
      if(count == 5'b11111)
        begin
          codeClk <= ~codeClk;
        end
      count <= count+1;
    end
  
endmodule
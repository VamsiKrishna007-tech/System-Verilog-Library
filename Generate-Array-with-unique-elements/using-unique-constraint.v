program unique_array;
  class C1;
    rand bit [4:0] A [];
    //constrain A's size between 10 to 15
    constraint c1 {
      A.size inside {[10:15]};}
    //use unique to generate unique elements in A
    constraint c2 {
      unique{A}; }
  endclass

  initial begin
    C1 C1_h = new();
    repeat(10) begin
      if(C1_h.randomize())
        $display("A is %p", C1_h.A);
      end
  end
endprogram

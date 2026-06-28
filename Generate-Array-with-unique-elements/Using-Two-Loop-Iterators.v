program unique_array;
  class C2;
    rand bit [4:0] A [];
    //constrain A's size between 10 to 15
    constraint c1 {
      A.size inside {[10:15]};}
    //use iterators and conditions to generate unique elements
    constraint c2 {
      foreach(A[i])
        foreach(A[j])
          if(i!=j)
            A[i] != A[j];}
  endclass

  initial begin
    C2 C2_h = new();
    repeat(10) begin
      if(C2_h.randomize())
        $display("A is %p", C2_h.A);
    end
  end
endprogram

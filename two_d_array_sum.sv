module tb;
  bit[1:0] a[2][2];
  int sum_of_a;
  
  initial begin
    std::randomize(a);
    sum_of_a = a.sum() with (item.sum() with (item));
    $display("sum_of_a = %0d",sum_of_a);
    #1 $finish();
  end
endmodule

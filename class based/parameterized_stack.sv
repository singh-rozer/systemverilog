module tb;
  class stack#(type t = int, int depth = 5);
    
    t array[depth];
    int idx = 0;
    
    function void push(input t data);
      if(idx != depth)
        array[idx++] = data;
      else
        $error("STACK FULL");
    endfunction
    
    function t pop();
      if(idx != 0)
        pop = array[--idx];
      else
        $error("STACK EMPTY);
    endfunction
    
  endclass
  
  stack#(int,10) stack_10;
  
  int temp;
  
  initial
    begin
      stack_10 = new();
      
      //temp = stack_10.pop();
      
      stack_10.push(10);
      stack_10.push(20);
      //stack_10.push(31);
      //stack_10.push(32);
      //stack_10.push(33);
      //stack_10.push(34);
      
      temp = stack_10.pop();
      
      $display("The poped out value from stack %0d",temp);
      //$display("The poped out value from stack %0d",stack_10.pop());
      
      #2 $finish();  
    end
endmodule

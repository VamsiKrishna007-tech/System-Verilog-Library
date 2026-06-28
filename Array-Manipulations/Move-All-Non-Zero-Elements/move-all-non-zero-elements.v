module tb;

    task automatic run_test(
        input string test_name,
        ref int input_arr[],
        ref int expected[]
    );

//Do not remove Default Code
//Write Your Code Here
        int temp, j=0;
        for (int i=0; i< input_arr.size(); i++) begin
          if (input_arr[i] != 0) begin
            temp = input_arr[i];
            input_arr[i] = input_arr[j];
            input_arr[j] = temp;
            j++;
          end
        end    

        if (input_arr.size() != expected.size()) begin
            $display("[FAIL] %s : Size mismatch", test_name);
            return;
        end

        foreach (expected[i]) begin
            if (input_arr[i] != expected[i]) begin
                $display("[FAIL] %s", test_name);
                $display("Expected = %p", expected);
                $display("Got      = %p", input_arr);
                return;
            end
        end

        $display("[PASS] %s", test_name);
        
    endtask

    initial begin
        int arr1[] = '{1,9,8,4,0,0,2,7,0,6,0};
        int exp1[] = '{1,9,8,4,2,7,6,0,0,0,0};

        int arr2[] = '{0,0,0,1,2,3};
        int exp2[] = '{1,2,3,0,0,0};

        int arr3[] = '{5};
        int exp3[] = '{5};

        $display("input_arr : %p", arr1);
        $display("expected : %p", exp1);

        run_test("Basic Example - 1", arr1, exp1);


        $display("input_arr : %p", arr2);
        $display("expected : %p", exp2);

        run_test("Leading Zeros - 2", arr2, exp2);

        $display("input_arr : %p", arr3);
        $display("expected : %p", exp3);
        run_test("Single Element - 3", arr3, exp3);
        
    end

endmodule

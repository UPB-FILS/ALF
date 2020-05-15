
(module
    ;; import functions
    (import "io" "writeint" (func $writeint
            (param $nr i32)
        )
    )
    ;; import the memory space from io
    (import "io" "mem" (memory 1))
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $n (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; writeint (...)
        ;; parameter nr
        ;; expression and
            ;; expression >
                ;; expression /
                    ;; expression *
                        ;; expression +
                            ;; value int 2
                            i32.const 2
                            ;; value int 3
                            i32.const 3
                        i32.add
                        ;; value int 7
                        i32.const 7
                    i32.mul
                    ;; value int 8
                    i32.const 8
                i32.div_s
                ;; value int 10
                i32.const 10
            i32.gt_s
            ;; expression xor
                ;; expression <
                    ;; expression +
                        ;; value int 7
                        i32.const 7
                        ;; value int 5
                        i32.const 5
                    i32.add
                    ;; value int 5
                    i32.const 5
                i32.lt_s
                ;; expression !=
                    ;; value int 7
                    i32.const 7
                    ;; variable n
                    global.get $n
                i32.ne
            i32.xor
        i32.and
        ;; typecast int bool
        call $writeint
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)

(module
    ;; import functions
    (import "io" "writeint" (func $writeint
            (param $nr i32)
    ))
    ;; import the memory space from io
    (import "io" "mem" (memory 1))
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; writeint (...)
        ;; parameter nr
        ;; expression and
            ;; expression >
                ;; expression +
                    ;; value int 2
                    i32.const 2
                    ;; value int 4
                    i32.const 4
                i32.add
                ;; expression *
                    ;; value int 5
                    i32.const 5
                    ;; value int 6
                    i32.const 6
                i32.mul
            i32.gt_s
            ;; expression <
                ;; expression +
                    ;; value int 4
                    i32.const 4
                    ;; value int 5
                    i32.const 5
                i32.add
                ;; expression /
                    ;; value int 6
                    i32.const 6
                    ;; value int 7
                    i32.const 7
                i32.div_s
            i32.lt_s
        i32.and
        ;; typecast int bool
        call $writeint
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
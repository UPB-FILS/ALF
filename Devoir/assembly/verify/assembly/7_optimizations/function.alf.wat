
(module
    ;; import functions
    (import "io" "writeint" (func $writeint
            (param $nr i32)
    ))
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; writeint (...)
        ;; parameter nr
        ;; expression +
            ;; value int 2
            i32.const 2
            ;; value int 6
            i32.const 6
        i32.add
        call $writeint
    )
    
    ;; function sum
    (func $sum
        (result i32)
        (local $base_pointer i32)
        ;; return
        ;; expression +
            ;; value int 2
            i32.const 2
            ;; value int 3
            i32.const 3
        i32.add
        return
        ;; drop unused value (int)
        drop
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
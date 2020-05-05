
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
        ;; value int 8
        i32.const 8
        call $writeint
    )
    
    ;; function sum
    (func $sum
        (result i32)
        (local $base_pointer i32)
        ;; return
        ;; value int 5
        i32.const 5
        return
        ;; drop unused value (int)
        drop
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
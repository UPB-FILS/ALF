
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
        ;; sum (...)
        ;; parameter n1
        ;; value int 3
        i32.const 3
        ;; parameter n2
        ;; value int 7
        i32.const 7
        call $sum
        call $writeint
    )
    
    ;; function sum
    (func $sum
        (param $n1 i32)
        (param $n2 i32)
        (result i32)
        (local $s i32)
        (local $base_pointer i32)
        ;; attribution
        ;; variable s
        ;; expression +
            ;; variable n1
            local.get $n1
            ;; variable n2
            local.get $n2
        i32.add
        local.set $s
        ;; return
        ;; variable s
        local.get $s
        return
        ;; drop unused value (int)
        drop
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)

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
        ;; attribution
        ;; variable n
        ;; value int 3
        i32.const 3
        ;; alternative i32.const undefined
        global.set $n
        ;; writeint (...)
        ;; parameter nr
        ;; expression +
            ;; variable n
            global.get $n
            ;; value int 4
            i32.const 4
        i32.add
        call $writeint
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
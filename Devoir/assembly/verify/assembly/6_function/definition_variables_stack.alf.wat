
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
        (local $base_pointer i32)
        ;; setup base pointer
        global.get $stack_pointer
        local.set $base_pointer
        ;; local stack variables
        global.get $stack_pointer
        i32.const 20
        i32.sub
        global.set $stack_pointer
        ;; attribution
        ;; array
        ;; variable s
        ;; address $base_pointer-0
        local.get $base_pointer
        i32.const 0
        i32.sub
            ;; index
            ;; value int 0
            i32.const 0
            i32.const 4
            i32.mul
            i32.add
        ;; expression +
            ;; variable n1
            local.get $n1
            ;; variable n2
            local.get $n2
        i32.add
        i32.store
        ;; return
        ;; array
        ;; variable s
        ;; address $base_pointer-0
        local.get $base_pointer
        i32.const 0
        i32.sub
        i32.load
            ;; index
            ;; value int 0
            i32.const 0
            i32.const 4
            i32.mul
            i32.add
        ;; delete local variables
        local.get $base_pointer
        global.set $stack_pointer
        return
        ;; drop unused value (int)
        drop
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
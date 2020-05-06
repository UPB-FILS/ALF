
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
    (global $v i32 (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; array
        ;; variable v
        ;; alternative i32.const 0
        global.get $v
            ;; index
            ;; value int 5
            i32.const 5
            i32.const 4
            i32.mul
            i32.add
        ;; value int 6
        i32.const 6
        i32.store
        ;; writeint (...)
        ;; parameter nr
        ;; array
        ;; variable v
        ;; alternative i32.const 0
        global.get $v
            ;; index
            ;; value int 5
            i32.const 5
            i32.const 4
            i32.mul
            i32.add
        call $writeint
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 36))
)

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
    (global $v i32 (i32.const 0))
    (global $p i32 (i32.const 36))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; array
        ;; variable p
        ;; alternative i32.const 36
        global.get $p
            ;; index
            ;; value int 5
            i32.const 5
            i32.const 4
            i32.mul
            i32.add
        ;; value int 5
        i32.const 5
        i32.store
        ;; attribution
        ;; array
        ;; variable v
        ;; alternative i32.const 0
        global.get $v
            ;; index
            ;; array
            ;; variable p
            ;; alternative i32.const 36
            global.get $p
                ;; index
                ;; value int 5
                i32.const 5
                i32.const 4
                i32.mul
                i32.add
            i32.const 4
            i32.mul
            i32.add
        ;; value int 7
        i32.const 7
        i32.store
        ;; writeint (...)
        ;; parameter nr
        ;; array
        ;; variable v
        ;; alternative i32.const 0
        global.get $v
            ;; index
            ;; array
            ;; variable p
            ;; alternative i32.const 36
            global.get $p
                ;; index
                ;; value int 5
                i32.const 5
                i32.const 4
                i32.mul
                i32.add
            i32.const 4
            i32.mul
            i32.add
        call $writeint
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 72))
)

(module
    ;; import functions
    (import "io" "readint" (func $readint
            (result i32)
        )
    )
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
    (global $s i32 (i32.const 36))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; array
        ;; variable v
        ;; alternative i32.const 0
        global.get $v
            ;; index
            ;; struct
            ;; variable s
            ;; alternative i32.const 36
            global.get $s
                ;; property position offset 0
                i32.const 0
                i32.add
            i32.const 4
            i32.mul
            i32.add
        ;; readint (...)
        call $readint
        i32.store
        ;; writeint (...)
        ;; parameter nr
        ;; array
        ;; variable v
        ;; alternative i32.const 0
        global.get $v
            ;; index
            ;; struct
            ;; variable s
            ;; alternative i32.const 36
            global.get $s
                ;; property position offset 0
                i32.const 0
                i32.add
            i32.const 4
            i32.mul
            i32.add
        call $writeint
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 40))
)
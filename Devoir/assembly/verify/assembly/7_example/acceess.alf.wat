
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
    (global $s i32 (i32.const 0))
    (global $s3 i32 (i32.const 264))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; struct
        ;; variable s
        ;; alternative i32.const 0
        global.get $s
            ;; property private offset 256
            i32.const 256
            i32.add
        ;; value bool true
        i32.const 1
        i32.store
        ;; writeint (...)
        ;; parameter nr
        ;; struct
        ;; variable s
        ;; alternative i32.const 0
        global.get $s
            ;; property private offset 256
            i32.const 256
            i32.add
        ;; typecast int bool
        call $writeint
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 528))
)
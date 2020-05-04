
(module
    ;; import functions
    (import "io" "writeint" (func $writeint
            (param $nr i32)
    ))
    (import "io" "readint" (func $readint
            (result i32)
    ))
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $x (mut i32) (i32.const 0))
    (global $y (mut i32) (i32.const 0))
    (global $s (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; variable x
        ;; call $readint
        call $readint
        global.set $x
        ;; attribution
        ;; variable y
        ;; call $readint
        call $readint
        global.set $y
        ;; attribution
        ;; variable s
        ;; expression +
            ;; variable x
            global.get $x
            ;; variable y
            global.get $y
        i32.add
        global.set $s
        ;; call $writeint
        ;; parameter nr
        ;; variable s
        global.get $s
        call $writeint
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
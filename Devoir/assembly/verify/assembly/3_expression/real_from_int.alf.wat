
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
    (global $s (mut f32) (f32.const 0))
    (global $n (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; variable n
        ;; call $readint
        call $readint
        global.set $n
        ;; attribution
        ;; variable s
        ;; variable n
        global.get $n
        ;; typecast real int
        f32.convert_s/i32
        global.set $s
        ;; call $writeint
        ;; parameter nr
        ;; variable s
        global.get $s
        ;; typecast int real
        i32.trunc_s/f32
        call $writeint
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
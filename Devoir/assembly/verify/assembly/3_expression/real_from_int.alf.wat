
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
    ;; base pointer
    (global $base_pointer (mut i32) (i32.const 0))
    
    
    ;; function script
    (func $script
        (local $s f32)
        (local $n i32)
        ;; attribution
        ;; variable n
        ;; call $readint
        call $readint
        local.set $n
        ;; attribution
        ;; variable s
        ;; variable n
        local.get $n
        ;; typecast real int
        f32.convert_s/i32
        local.set $s
        ;; call $writeint
        ;; parameter nr
        ;; variable s
        local.get $s
        ;; typecast int real
        i32.trunc_s/f32
        call $writeint
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
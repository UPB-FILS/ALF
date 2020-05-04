
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
        (local $x i32)
        (local $y i32)
        (local $s i32)
        ;; attribution
        ;; variable x
        ;; call $readint
        call $readint
        local.set $x
        ;; attribution
        ;; variable y
        ;; call $readint
        call $readint
        local.set $y
        ;; attribution
        ;; variable s
        ;; expression +
            ;; variable x
            local.get $x
            ;; variable y
            local.get $y
        i32.add
        local.set $s
        ;; call $writeint
        ;; parameter nr
        ;; variable s
        local.get $s
        call $writeint
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
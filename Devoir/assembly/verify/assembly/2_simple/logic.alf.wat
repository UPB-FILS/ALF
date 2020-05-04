
(module
    ;; import functions
    (import "io" "writeint" (func $writeint
            (param $nr i32)
    ))
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    ;; base pointer
    (global $base_pointer (mut i32) (i32.const 0))
    
    
    ;; function script
    (func $script
        (local $a i32)
        ;; attribution
        ;; variable a
        ;; value bool false
        i32.const 0
        local.set $a
        ;; call $writeint
        ;; parameter nr
        ;; variable a
        local.get $a
        ;; typecast int bool
        call $writeint
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
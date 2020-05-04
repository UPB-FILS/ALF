
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
        (local $n i32)
        ;; attribution
        ;; variable n
        ;; value int 6
        i32.const 6
        local.set $n
        ;; call $writeint
        ;; parameter nr
        ;; variable n
        local.get $n
        call $writeint
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)

(module
    ;; import functions
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    ;; base pointer
    (global $base_pointer (mut i32) (i32.const 0))
    
    
    ;; function script
    (func $script
        (local $variable i32)
        ;; attribution
        ;; variable variable
        ;; value int 0
        i32.const 0
        local.set $variable
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
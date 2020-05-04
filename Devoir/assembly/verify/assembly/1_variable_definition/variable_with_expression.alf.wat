
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
        (local $e i32)
        ;; attribution
        ;; variable e
        ;; expression +
            ;; value int 20
            i32.const 20
            ;; expression *
                ;; value int 3
                i32.const 3
                ;; value int 5
                i32.const 5
            i32.mul
        i32.add
        local.set $e
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
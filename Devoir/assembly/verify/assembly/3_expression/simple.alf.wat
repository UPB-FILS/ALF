
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
        ;; expression +
            ;; value int 2
            i32.const 2
            ;; value int 3
            i32.const 3
        i32.add
        ;; drop unused value (int)
        drop
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
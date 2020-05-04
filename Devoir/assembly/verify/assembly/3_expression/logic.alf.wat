
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
        ;; call $writeint
        ;; parameter nr
        ;; expression ==
            ;; expression +
                ;; value int 2
                i32.const 2
                ;; value int 3
                i32.const 3
            i32.add
            ;; expression +
                ;; value int 4
                i32.const 4
                ;; value int 5
                i32.const 5
            i32.add
        i32.eq
        ;; typecast int bool
        call $writeint
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)

(module
    ;; import functions
    (import "io" "writefloat" (func $writefloat
            (param $nr f32)
    ))
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    ;; base pointer
    (global $base_pointer (mut i32) (i32.const 0))
    
    
    ;; function script
    (func $script
        (local $a f32)
        ;; attribution
        ;; variable a
        ;; value real 3.7
        f32.const 3.7
        local.set $a
        ;; call $writefloat
        ;; parameter nr
        ;; variable a
        local.get $a
        call $writefloat
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
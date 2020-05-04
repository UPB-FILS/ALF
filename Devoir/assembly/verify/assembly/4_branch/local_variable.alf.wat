
(module
    ;; import functions
    (import "io" "writefloat" (func $writefloat
            (param $nr f32)
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
        (local $a i32)
        (local $if_13_a f32)
        ;; attribution
        ;; variable a
        ;; call $readint
        call $readint
        local.set $a
        ;; if
            ;; expression <
                ;; variable a
                local.get $a
                ;; value int 120
                i32.const 120
            i32.lt_s
        if
            ;; attribution
            ;; variable a
            ;; value real 1.2
            f32.const 1.2
            local.set $if_13_a
            ;; call $writefloat
            ;; parameter nr
            ;; variable a
            local.get $if_13_a
            call $writefloat
        end
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
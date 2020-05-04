
(module
    ;; import functions
    (import "io" "writechar" (func $writechar
            (param $char i32)
    ))
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    ;; base pointer
    (global $base_pointer (mut i32) (i32.const 0))
    
    
    ;; function script
    (func $script
        (local $c i32)
        ;; attribution
        ;; variable c
        ;; value character s
        i32.const 115
        local.set $c
        ;; attribution
        ;; variable c
        ;; expression +
            ;; variable c
            local.get $c
            ;; typecast int character
            ;; value int 6
            i32.const 6
        i32.add
        ;; typecast character int
        i32.const 0x000000ff
        i32.and
        local.set $c
        ;; call $writechar
        ;; parameter char
        ;; variable c
        local.get $c
        call $writechar
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
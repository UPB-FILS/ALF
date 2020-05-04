
(module
    ;; import functions
    (import "io" "writechar" (func $writechar
            (param $char i32)
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
        (local $e i32)
        ;; attribution
        ;; variable a
        ;; call $readint
        call $readint
        local.set $a
        ;; attribution
        ;; variable e
        ;; value character e
        i32.const 101
        local.set $e
        ;; if
            ;; expression ==
                ;; expression mod
                    ;; variable a
                    local.get $a
                    ;; value int 2
                    i32.const 2
                i32.rem_s
                ;; value int 1
                i32.const 1
            i32.eq
        if
            ;; attribution
            ;; variable e
            ;; value character o
            i32.const 111
            local.set $e
        end
        ;; call $writechar
        ;; parameter char
        ;; variable e
        local.get $e
        call $writechar
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
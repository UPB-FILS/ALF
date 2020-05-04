
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
        ;; if
            ;; expression ==
                ;; expression mod
                    ;; variable a
                    local.get $a
                    ;; value int 2
                    i32.const 2
                i32.rem_s
                ;; value int 0
                i32.const 0
            i32.eq
        if
            ;; if
                ;; expression ==
                    ;; expression mod
                        ;; variable a
                        local.get $a
                        ;; value int 6
                        i32.const 6
                    i32.rem_s
                    ;; value int 0
                    i32.const 0
                i32.eq
            if
                ;; attribution
                ;; variable e
                ;; value character y
                i32.const 121
                local.set $e
            else
                ;; attribution
                ;; variable e
                ;; value character n
                i32.const 110
                local.set $e
            end
        else
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
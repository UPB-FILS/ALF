
(module
    ;; import functions
    (import "io" "readint" (func $readint
            (result i32)
    ))
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
        (local $number i32)
        (local $digits i32)
        ;; attribution
        ;; variable digits
        ;; value int 0
        i32.const 0
        local.set $digits
        ;; attribution
        ;; variable number
        ;; call $readint
        call $readint
        local.set $number
        ;; if
            ;; expression ==
                ;; variable number
                local.get $number
                ;; value int 0
                i32.const 0
            i32.eq
        if
            ;; attribution
            ;; variable digits
            ;; value int 1
            i32.const 1
            local.set $digits
        end
        ;; while
        block $script_end
            loop $script_begin
                ;; expression !=
                    ;; variable number
                    local.get $number
                    ;; value int 0
                    i32.const 0
                i32.ne
                i32.eqz
                br_if $script_end
                    ;; attribution
                    ;; variable number
                    ;; expression /
                        ;; variable number
                        local.get $number
                        ;; value int 10
                        i32.const 10
                    i32.div_s
                    local.set $number
                    ;; attribution
                    ;; variable digits
                    ;; expression +
                        ;; variable digits
                        local.get $digits
                        ;; value int 1
                        i32.const 1
                    i32.add
                    local.set $digits
                br $script_begin
            end $script_begin
        end $script_end
        ;; call $writeint
        ;; parameter nr
        ;; variable digits
        local.get $digits
        call $writeint
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
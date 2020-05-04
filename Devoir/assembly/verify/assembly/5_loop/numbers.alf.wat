
(module
    ;; import functions
    (import "io" "writeint" (func $writeint
            (param $nr i32)
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
        (local $x i32)
        (local $y i32)
        (local $w i32)
        (local $i i32)
        (local $for_18_i i32)
        (local $for_22_i i32)
        ;; attribution
        ;; variable x
        ;; call $readint
        call $readint
        local.set $x
        ;; attribution
        ;; variable y
        ;; call $readint
        call $readint
        local.set $y
        ;; attribution
        ;; variable w
        ;; call $readint
        call $readint
        local.set $w
        ;; if
            ;; expression <
                ;; variable x
                local.get $x
                ;; variable y
                local.get $y
            i32.lt_s
        if
            ;; for
            ;; from
                ;; attribution
                ;; variable for_18_i
                ;; variable x
                local.get $x
                local.set $for_18_i
            block $for_18_end
                loop $for_18_begin
                    ;; to
                    ;; variable for_18_i
                    local.get $for_18_i
                    ;; variable y
                    local.get $y
                    i32.gt_s
                    br_if $for_18_end
                        ;; call $writeint
                        ;; parameter nr
                        ;; variable i
                        local.get $for_18_i
                        ;; typecast int undefined
                        call $writeint
                        ;; attribution
                        ;; variable for_18_i
                        ;; expression +
                            ;; variable for_18_i
                            local.get $for_18_i
                            ;; value int 1
                            i32.const 1
                        i32.add
                        ;; typecast int undefined
                        local.set $for_18_i
                    br $for_18_begin
                end $for_18_begin
            end $for_18_end
        else
            ;; for
            ;; from
                ;; attribution
                ;; variable for_22_i
                ;; variable x
                local.get $x
                local.set $for_22_i
            block $for_22_end
                loop $for_22_begin
                    ;; to
                    ;; variable for_22_i
                    local.get $for_22_i
                    ;; variable y
                    local.get $y
                    i32.lt_s
                    br_if $for_22_end
                        ;; call $writeint
                        ;; parameter nr
                        ;; variable i
                        local.get $for_22_i
                        ;; typecast int undefined
                        call $writeint
                        ;; attribution
                        ;; variable for_22_i
                        ;; expression -
                            ;; variable for_22_i
                            local.get $for_22_i
                            ;; value int 1
                            i32.const 1
                        i32.sub
                        ;; typecast int undefined
                        local.set $for_22_i
                    br $for_22_begin
                end $for_22_begin
            end $for_22_end
        end
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
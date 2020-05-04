
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
        (local $nr i32)
        (local $i i32)
        (local $for_14_i i32)
        ;; attribution
        ;; variable nr
        ;; call $readint
        call $readint
        local.set $nr
        ;; for
        ;; from
            ;; attribution
            ;; variable for_14_i
            ;; value int 2
            i32.const 2
            local.set $for_14_i
        block $for_14_end
            loop $for_14_begin
                ;; to
                ;; variable for_14_i
                local.get $for_14_i
                ;; variable nr
                local.get $nr
                i32.gt_s
                br_if $for_14_end
                    ;; if
                        ;; expression ==
                            ;; expression mod
                                ;; variable i
                                local.get $for_14_i
                                ;; value int 2
                                i32.const 2
                                ;; typecast undefined int
                            i32.rem_s
                            ;; value int 0
                            i32.const 0
                            ;; typecast undefined int
                        i32.eq
                    if
                        ;; call $writeint
                        ;; parameter nr
                        ;; variable i
                        local.get $for_14_i
                        ;; typecast int undefined
                        call $writeint
                    end
                    ;; attribution
                    ;; variable for_14_i
                    ;; expression +
                        ;; variable for_14_i
                        local.get $for_14_i
                        ;; value int 1
                        i32.const 1
                    i32.add
                    ;; typecast int undefined
                    local.set $for_14_i
                br $for_14_begin
            end $for_14_begin
        end $for_14_end
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
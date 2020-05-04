
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
        (local $p i32)
        (local $isPrime i32)
        (local $i i32)
        (local $s i32)
        (local $for_19_i i32)
        ;; attribution
        ;; variable s
        ;; value bool false
        i32.const 0
        local.set $s
        ;; while
        block $script_end
            loop $script_begin
                ;; expression not
                ;; variable s
                local.get $s
                i32.const 0
                i32.eq
                i32.eqz
                br_if $script_end
                    ;; attribution
                    ;; variable p
                    ;; call $readint
                    call $readint
                    local.set $p
                    ;; attribution
                    ;; variable isPrime
                    ;; value bool true
                    i32.const 1
                    local.set $isPrime
                    ;; for
                    ;; from
                        ;; attribution
                        ;; variable for_19_i
                        ;; value int 2
                        i32.const 2
                        local.set $for_19_i
                    block $for_19_end
                        loop $for_19_begin
                            ;; to
                            ;; variable for_19_i
                            local.get $for_19_i
                            ;; expression /
                                ;; variable p
                                local.get $p
                                ;; value int 2
                                i32.const 2
                            i32.div_s
                            i32.gt_s
                            br_if $for_19_end
                                ;; if
                                    ;; expression ==
                                        ;; expression mod
                                            ;; variable p
                                            local.get $p
                                            ;; variable i
                                            local.get $for_19_i
                                        i32.rem_s
                                        ;; value int 0
                                        i32.const 0
                                        ;; typecast undefined int
                                    i32.eq
                                if
                                    ;; attribution
                                    ;; variable isPrime
                                    ;; value bool false
                                    i32.const 0
                                    ;; typecast undefined bool
                                    local.set $isPrime
                                end
                                ;; attribution
                                ;; variable for_19_i
                                ;; expression +
                                    ;; variable for_19_i
                                    local.get $for_19_i
                                    ;; value int 1
                                    i32.const 1
                                i32.add
                                ;; typecast int undefined
                                local.set $for_19_i
                            br $for_19_begin
                        end $for_19_begin
                    end $for_19_end
                    ;; if
                        ;; expression not
                        ;; variable isPrime
                        local.get $isPrime
                        i32.const 0
                        i32.eq
                    if
                        ;; call $writeint
                        ;; parameter nr
                        ;; variable p
                        local.get $p
                        call $writeint
                    end
                    ;; attribution
                    ;; variable s
                    ;; variable isPrime
                    local.get $isPrime
                    local.set $s
                br $script_begin
            end $script_begin
        end $script_end
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
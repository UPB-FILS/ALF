
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
    
    ;; global variables
    (global $x (mut i32) (i32.const 0))
    (global $y (mut i32) (i32.const 0))
    (global $w (mut i32) (i32.const 0))
    (global $i (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $for_18_i i32)
        (local $for_22_i i32)
        (local $base_pointer i32)
        ;; attribution
        ;; variable x
        ;; readint (...)
        call $readint
        global.set $x
        ;; attribution
        ;; variable y
        ;; readint (...)
        call $readint
        global.set $y
        ;; attribution
        ;; variable w
        ;; readint (...)
        call $readint
        global.set $w
        ;; if
            ;; expression <
                ;; variable x
                global.get $x
                ;; variable y
                global.get $y
            i32.lt_s
        if
            ;; for
            ;; from
                ;; attribution
                ;; variable for_18_i
                ;; variable x
                global.get $x
                local.set $for_18_i
            block $for_18_end
                loop $for_18_begin
                    ;; to
                    ;; variable for_18_i
                    local.get $for_18_i
                    ;; variable y
                    global.get $y
                    i32.gt_s
                    br_if $for_18_end
                        ;; writeint (...)
                        ;; parameter nr
                        ;; variable i
                        local.get $for_18_i
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
                global.get $x
                local.set $for_22_i
            block $for_22_end
                loop $for_22_begin
                    ;; to
                    ;; variable for_22_i
                    local.get $for_22_i
                    ;; variable y
                    global.get $y
                    i32.lt_s
                    br_if $for_22_end
                        ;; writeint (...)
                        ;; parameter nr
                        ;; variable i
                        local.get $for_22_i
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
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)

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
    
    ;; global variables
    (global $nr (mut i32) (i32.const 0))
    (global $i (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $for_14_i i32)
        (local $base_pointer i32)
        ;; attribution
        ;; variable nr
        ;; readint (...)
        call $readint
        global.set $nr
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
                global.get $nr
                i32.gt_s
                br_if $for_14_end
                    ;; if
                        ;; expression ==
                            ;; expression mod
                                ;; variable i
                                local.get $for_14_i
                                ;; value int 2
                                i32.const 2
                            i32.rem_s
                            ;; value int 0
                            i32.const 0
                        i32.eq
                    if
                        ;; writeint (...)
                        ;; parameter nr
                        ;; variable i
                        local.get $for_14_i
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
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
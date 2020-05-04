
(module
    ;; import functions
    (import "io" "writeint" (func $writeint
            (param $nr i32)
    ))
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $i (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $for_9_i i32)
        (local $base_pointer i32)
        ;; for
        ;; from
            ;; attribution
            ;; variable for_9_i
            ;; value int 1
            i32.const 1
            local.set $for_9_i
        block $for_9_end
            loop $for_9_begin
                ;; to
                ;; variable for_9_i
                local.get $for_9_i
                ;; value int 6
                i32.const 6
                i32.gt_s
                br_if $for_9_end
                    ;; call $writeint
                    ;; parameter nr
                    ;; variable i
                    local.get $for_9_i
                    call $writeint
                    ;; attribution
                    ;; variable for_9_i
                    ;; expression +
                        ;; variable for_9_i
                        local.get $for_9_i
                        ;; value int 1
                        i32.const 1
                    i32.add
                    ;; typecast int undefined
                    local.set $for_9_i
                br $for_9_begin
            end $for_9_begin
        end $for_9_end
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
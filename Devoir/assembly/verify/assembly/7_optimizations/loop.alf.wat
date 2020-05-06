
(module
    ;; import functions
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $i (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $for_13_i i32)
        (local $base_pointer i32)
        ;; attribution
        ;; variable i
        ;; expression *
            ;; value int 1024
            i32.const 1024
            ;; value int 100
            i32.const 100
        i32.mul
        global.set $i
        ;; while
        block $script_end
            loop $script_begin
                ;; expression >
                    ;; variable i
                    global.get $i
                    ;; expression *
                        ;; value int 2
                        i32.const 2
                        ;; value int 5
                        i32.const 5
                    i32.mul
                i32.gt_s
                i32.eqz
                br_if $script_end
                    ;; attribution
                    ;; variable i
                    ;; expression -
                        ;; variable i
                        global.get $i
                        ;; expression *
                            ;; value int 10
                            i32.const 10
                            ;; value int 10
                            i32.const 10
                        i32.mul
                    i32.sub
                    global.set $i
                br $script_begin
            end $script_begin
        end $script_end
        ;; do while
        loop $script
            ;; attribution
            ;; variable i
            ;; expression -
                ;; variable i
                global.get $i
                ;; expression *
                    ;; value int 10
                    i32.const 10
                    ;; value int 12
                    i32.const 12
                i32.mul
            i32.sub
            global.set $i
            ;; expression >
                ;; variable i
                global.get $i
                ;; expression *
                    ;; value int 2
                    i32.const 2
                    ;; value int 5
                    i32.const 5
                i32.mul
            i32.gt_s
            br_if $script
        end $script
        ;; for
        ;; from
            ;; attribution
            ;; variable for_13_i
            ;; expression +
                ;; value int 1
                i32.const 1
                ;; value int 1
                i32.const 1
            i32.add
            local.set $for_13_i
        block $for_13_end
            loop $for_13_begin
                ;; to
                ;; variable for_13_i
                local.get $for_13_i
                ;; expression *
                    ;; value int 10
                    i32.const 10
                    ;; value int 100
                    i32.const 100
                i32.mul
                i32.gt_s
                br_if $for_13_end
                    ;; attribution
                    ;; variable i
                    ;; expression *
                        ;; value int 50
                        i32.const 50
                        ;; value int 20
                        i32.const 20
                    i32.mul
                    local.set $for_13_i
                    ;; attribution
                    ;; variable for_13_i
                    ;; expression +
                        ;; variable for_13_i
                        local.get $for_13_i
                        ;; value int 1
                        i32.const 1
                    i32.add
                    ;; typecast int undefined
                    local.set $for_13_i
                br $for_13_begin
            end $for_13_begin
        end $for_13_end
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
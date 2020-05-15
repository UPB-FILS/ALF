
(module
    ;; import functions
    (import "io" "writeint" (func $writeint
            (param $nr i32)
    ))
    (import "io" "readint" (func $readint
            (result i32)
    ))
    ;; import the memory space from io
    (import "io" "mem" (memory 1))
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $p (mut i32) (i32.const 0))
    (global $isPrime (mut i32) (i32.const 0))
    (global $i (mut i32) (i32.const 0))
    (global $s (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $for_19_i i32)
        (local $base_pointer i32)
        ;; attribution
        ;; variable s
        ;; value bool false
        i32.const 0
        ;; alternative i32.const undefined
        global.set $s
        ;; while
        block $script_end
            loop $script_begin
                ;; expression not
                ;; variable s
                global.get $s
                i32.const 0
                i32.eq
                i32.eqz
                br_if $script_end
                    ;; attribution
                    ;; variable p
                    ;; readint (...)
                    call $readint
                    ;; alternative i32.const undefined
                    global.set $p
                    ;; attribution
                    ;; variable isPrime
                    ;; value bool true
                    i32.const 1
                    ;; alternative i32.const undefined
                    global.set $isPrime
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
                                global.get $p
                                ;; value int 2
                                i32.const 2
                            i32.div_s
                            i32.gt_s
                            br_if $for_19_end
                                ;; if
                                    ;; expression ==
                                        ;; expression mod
                                            ;; variable p
                                            global.get $p
                                            ;; variable i
                                            local.get $for_19_i
                                        i32.rem_s
                                        ;; value int 0
                                        i32.const 0
                                    i32.eq
                                if
                                    ;; attribution
                                    ;; variable isPrime
                                    ;; value bool false
                                    i32.const 0
                                    ;; alternative i32.const undefined
                                    global.set $isPrime
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
                        global.get $isPrime
                        i32.const 0
                        i32.eq
                    if
                        ;; writeint (...)
                        ;; parameter nr
                        ;; variable p
                        global.get $p
                        call $writeint
                    end
                    ;; attribution
                    ;; variable s
                    ;; variable isPrime
                    global.get $isPrime
                    ;; alternative i32.const undefined
                    global.set $s
                br $script_begin
            end $script_begin
        end $script_end
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
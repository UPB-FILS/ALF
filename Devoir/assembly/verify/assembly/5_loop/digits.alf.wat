
(module
    ;; import functions
    (import "io" "readint" (func $readint
            (result i32)
    ))
    (import "io" "writeint" (func $writeint
            (param $nr i32)
    ))
    ;; import the memory space from io
    (import "io" "mem" (memory 1))
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $number (mut i32) (i32.const 0))
    (global $digits (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; variable digits
        ;; value int 0
        i32.const 0
        ;; alternative i32.const undefined
        global.set $digits
        ;; attribution
        ;; variable number
        ;; readint (...)
        call $readint
        ;; alternative i32.const undefined
        global.set $number
        ;; if
            ;; expression ==
                ;; variable number
                global.get $number
                ;; value int 0
                i32.const 0
            i32.eq
        if
            ;; attribution
            ;; variable digits
            ;; value int 1
            i32.const 1
            ;; alternative i32.const undefined
            global.set $digits
        end
        ;; while
        block $script_end
            loop $script_begin
                ;; expression !=
                    ;; variable number
                    global.get $number
                    ;; value int 0
                    i32.const 0
                i32.ne
                i32.eqz
                br_if $script_end
                    ;; attribution
                    ;; variable number
                    ;; expression /
                        ;; variable number
                        global.get $number
                        ;; value int 10
                        i32.const 10
                    i32.div_s
                    ;; alternative i32.const undefined
                    global.set $number
                    ;; attribution
                    ;; variable digits
                    ;; expression +
                        ;; variable digits
                        global.get $digits
                        ;; value int 1
                        i32.const 1
                    i32.add
                    ;; alternative i32.const undefined
                    global.set $digits
                br $script_begin
            end $script_begin
        end $script_end
        ;; writeint (...)
        ;; parameter nr
        ;; variable digits
        global.get $digits
        call $writeint
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
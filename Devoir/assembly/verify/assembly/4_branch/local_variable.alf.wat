
(module
    ;; import functions
    (import "io" "writefloat" (func $writefloat
            (param $nr f32)
    ))
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
    (global $a (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $if_14_a f32)
        (local $base_pointer i32)
        ;; attribution
        ;; variable a
        ;; readint (...)
        call $readint
        ;; alternative i32.const undefined
        global.set $a
        ;; if
            ;; expression <
                ;; variable a
                global.get $a
                ;; value int 120
                i32.const 120
            i32.lt_s
        if
            ;; attribution
            ;; variable a
            ;; value real 1.2
            f32.const 1.2
            local.set $if_14_a
            ;; writefloat (...)
            ;; parameter nr
            ;; variable a
            local.get $if_14_a
            call $writefloat
        end
        ;; writeint (...)
        ;; parameter nr
        ;; variable a
        global.get $a
        call $writeint
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
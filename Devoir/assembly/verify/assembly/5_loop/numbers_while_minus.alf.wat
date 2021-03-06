
(module
    ;; import functions
    (import "io" "readint" (func $readint
            (result i32)
        )
    )
    (import "io" "writefloat" (func $writefloat
            (param $nr f32)
        )
    )
    ;; import the memory space from io
    (import "io" "mem" (memory 1))
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $i (mut i32) (i32.const 0))
    (global $h (mut f32) (f32.const 0))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; do while
        loop $do_while_14
            ;; attribution
            ;; variable i
            ;; readint (...)
            call $readint
            ;; alternative i32.const undefined
            global.set $i
            ;; attribution
            ;; variable h
            ;; variable i
            global.get $i
            ;; typecast real int
            f32.convert_s/i32
            ;; alternative i32.const undefined
            global.set $h
            ;; writefloat (...)
            ;; parameter nr
            ;; variable h
            global.get $h
            call $writefloat
            ;; expression >=
                ;; variable i
                global.get $i
                ;; value int 0
                i32.const 0
            i32.ge_s
            ;; if exp is true, go to while
            br_if $do_while_14
        end $do_while_14
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
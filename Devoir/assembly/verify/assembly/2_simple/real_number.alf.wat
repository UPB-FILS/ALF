
(module
    ;; import functions
    (import "io" "writefloat" (func $writefloat
            (param $nr f32)
    ))
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $a (mut f32) (f32.const 0))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; variable a
        ;; value real 3.7
        f32.const 3.7
        ;; alternative i32.const undefined
        global.set $a
        ;; writefloat (...)
        ;; parameter nr
        ;; variable a
        global.get $a
        call $writefloat
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
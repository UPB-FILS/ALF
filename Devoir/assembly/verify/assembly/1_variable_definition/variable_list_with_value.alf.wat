
(module
    ;; import functions
    ;; import the memory space from io
    (import "io" "mem" (memory 1))
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $n (mut i32) (i32.const 0))
    (global $r (mut f32) (f32.const 0))
    (global $l (mut i32) (i32.const 0))
    (global $s i32 (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; variable n
        ;; value int 3
        i32.const 3
        ;; alternative i32.const undefined
        global.set $n
        ;; attribution
        ;; variable r
        ;; value real 3.7
        f32.const 3.7
        ;; alternative i32.const undefined
        global.set $r
        ;; attribution
        ;; variable l
        ;; value bool false
        i32.const 0
        ;; alternative i32.const undefined
        global.set $l
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 256))
)
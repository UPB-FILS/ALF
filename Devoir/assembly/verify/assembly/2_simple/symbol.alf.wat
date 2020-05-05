
(module
    ;; import functions
    (import "io" "writechar" (func $writechar
            (param $char i32)
    ))
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $c (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; variable c
        ;; value character s
        i32.const 115
        global.set $c
        ;; attribution
        ;; variable c
        ;; expression +
            ;; variable c
            global.get $c
            ;; typecast int character
            ;; value int 6
            i32.const 6
        i32.add
        ;; typecast character int
        i32.const 0x000000ff
        i32.and
        global.set $c
        ;; writechar (...)
        ;; parameter char
        ;; variable c
        global.get $c
        call $writechar
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)

(module
    ;; import functions
    (import "io" "writechar" (func $writechar
            (param $char i32)
    ))
    (import "io" "readint" (func $readint
            (result i32)
    ))
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $a (mut i32) (i32.const 0))
    (global $e (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; variable a
        ;; readint (...)
        call $readint
        global.set $a
        ;; attribution
        ;; variable e
        ;; value character e
        i32.const 101
        global.set $e
        ;; if
            ;; expression ==
                ;; expression mod
                    ;; variable a
                    global.get $a
                    ;; value int 2
                    i32.const 2
                i32.rem_s
                ;; value int 1
                i32.const 1
            i32.eq
        if
            ;; attribution
            ;; variable e
            ;; value character o
            i32.const 111
            global.set $e
        end
        ;; writechar (...)
        ;; parameter char
        ;; variable e
        global.get $e
        call $writechar
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
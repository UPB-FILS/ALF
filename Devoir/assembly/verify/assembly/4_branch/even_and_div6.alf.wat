
(module
    ;; import functions
    (import "io" "writechar" (func $writechar
            (param $char i32)
    ))
    (import "io" "readint" (func $readint
            (result i32)
    ))
    ;; import the memory space from io
    (import "io" "mem" (memory 1))
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
        ;; alternative i32.const undefined
        global.set $a
        ;; if
            ;; expression ==
                ;; expression mod
                    ;; variable a
                    global.get $a
                    ;; value int 2
                    i32.const 2
                i32.rem_s
                ;; value int 0
                i32.const 0
            i32.eq
        if
            ;; if
                ;; expression ==
                    ;; expression mod
                        ;; variable a
                        global.get $a
                        ;; value int 6
                        i32.const 6
                    i32.rem_s
                    ;; value int 0
                    i32.const 0
                i32.eq
            if
                ;; attribution
                ;; variable e
                ;; value character y
                i32.const 121
                ;; alternative i32.const undefined
                global.set $e
            else
                ;; attribution
                ;; variable e
                ;; value character n
                i32.const 110
                ;; alternative i32.const undefined
                global.set $e
            end
        else
            ;; attribution
            ;; variable e
            ;; value character o
            i32.const 111
            ;; alternative i32.const undefined
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
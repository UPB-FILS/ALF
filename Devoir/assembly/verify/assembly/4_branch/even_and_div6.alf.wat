
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
        ;; call $readint
        call $readint
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
                global.set $e
            else
                ;; attribution
                ;; variable e
                ;; value character n
                i32.const 110
                global.set $e
            end
        else
            ;; attribution
            ;; variable e
            ;; value character o
            i32.const 111
            global.set $e
        end
        ;; call $writechar
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
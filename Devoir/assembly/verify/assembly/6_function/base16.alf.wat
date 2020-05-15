
(module
    ;; import functions
    (import "io" "writeint" (func $writeint
            (param $nr i32)
        )
    )
    (import "io" "writechar" (func $writechar
            (param $char i32)
        )
    )
    (import "io" "readint" (func $readint
            (result i32)
        )
    )
    ;; import the memory space from io
    (import "io" "mem" (memory 1))
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $number (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; variable number
        ;; readint (...)
        call $readint
        ;; alternative i32.const undefined
        global.set $number
        ;; base16 (...)
        ;; parameter number
        ;; variable number
        global.get $number
        call $base16
    )
    
    ;; function base16
    (func $base16
        (param $number i32)
        (local $a i32)
        (local $base_pointer i32)
        ;; if
            ;; expression >
                ;; variable number
                local.get $number
                ;; value int 0
                i32.const 0
            i32.gt_s
        if
            ;; base16 (...)
            ;; parameter number
            ;; expression /
                ;; variable number
                local.get $number
                ;; value int 16
                i32.const 16
            i32.div_s
            call $base16
            ;; attribution
            ;; variable a
            ;; expression mod
                ;; variable number
                local.get $number
                ;; value int 16
                i32.const 16
            i32.rem_s
            local.set $a
            ;; if
                ;; expression >=
                    ;; variable a
                    local.get $a
                    ;; value int 10
                    i32.const 10
                i32.ge_s
            if
                ;; writechar (...)
                ;; parameter char
                ;; expression -
                    ;; expression +
                        ;; value character a
                        i32.const 97
                        ;; typecast int character
                        ;; variable a
                        local.get $a
                    i32.add
                    ;; value int 10
                    i32.const 10
                i32.sub
                ;; typecast character int
                i32.const 0x000000ff
                i32.and
                call $writechar
            else
                ;; writechar (...)
                ;; parameter char
                ;; expression +
                    ;; value character 0
                    i32.const 48
                    ;; typecast int character
                    ;; variable a
                    local.get $a
                i32.add
                ;; typecast character int
                i32.const 0x000000ff
                i32.and
                call $writechar
            end
        end
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
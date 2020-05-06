
(module
    ;; import functions
    (import "io" "writeint" (func $writeint
            (param $nr i32)
    ))
    (import "io" "readint" (func $readint
            (result i32)
    ))
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $item (mut i32) (i32.const 0))
    (global $stack (mut i32) (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; variable item
        ;; readint (...)
        call $readint
        ;; alternative i32.const undefined
        global.set $item
        ;; writeint (...)
        ;; parameter nr
        ;; fibonacci (...)
        ;; parameter item
        ;; variable item
        global.get $item
        call $fibonacci
        call $writeint
    )
    
    ;; function fibonacci
    (func $fibonacci
        (param $item i32)
        (result i32)
        (local $value i32)
        (local $base_pointer i32)
        ;; if
            ;; expression or
                ;; expression ==
                    ;; variable item
                    local.get $item
                    ;; value int 0
                    i32.const 0
                i32.eq
                ;; expression ==
                    ;; variable item
                    local.get $item
                    ;; value int 1
                    i32.const 1
                i32.eq
            i32.or
        if
            ;; attribution
            ;; variable value
            ;; value int 1
            i32.const 1
            local.set $value
        else
            ;; attribution
            ;; variable value
            ;; expression +
                ;; fibonacci (...)
                ;; parameter item
                ;; expression -
                    ;; variable item
                    local.get $item
                    ;; value int 2
                    i32.const 2
                i32.sub
                call $fibonacci
                ;; fibonacci (...)
                ;; parameter item
                ;; expression -
                    ;; variable item
                    local.get $item
                    ;; value int 1
                    i32.const 1
                i32.sub
                call $fibonacci
            i32.add
            local.set $value
        end
        ;; return
        ;; variable value
        local.get $value
        return
        ;; drop unused value (int)
        drop
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
)
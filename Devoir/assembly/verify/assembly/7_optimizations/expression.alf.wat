
(module
    ;; import functions
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; value int 13
        i32.const 13
        ;; drop unused value (int)
        drop
        ;; value int 168
        i32.const 168
        ;; drop unused value (int)
        drop
        ;; value string hello world
        global.get $strings_start
        i32.const 0
        i32.add
        i32.load
        ;; drop unused value (string)
        drop
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
    (data (i32.const 0) "\0bhello world")
)
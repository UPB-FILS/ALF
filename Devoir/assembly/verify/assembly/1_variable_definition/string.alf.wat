
(module
    ;; import functions
    ;; import the memory space from io
    (import "io" "mem" (memory 1))
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; value string string1
        global.get $strings_start
        i32.const 0
        i32.add
        ;; drop unused value (string)
        drop
        ;; value string string2
        global.get $strings_start
        i32.const 256
        i32.add
        ;; drop unused value (string)
        drop
        ;; value string string3
        global.get $strings_start
        i32.const 512
        i32.add
        ;; drop unused value (string)
        drop
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
    (data (i32.const 0) "\07string1")
    (data (i32.const 256) "\07string2")
    (data (i32.const 512) "\07string3")
)
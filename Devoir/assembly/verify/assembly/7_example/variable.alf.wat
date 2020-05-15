
(module
    ;; import functions
    ;; import the memory space from io
    (import "io" "mem" (memory 1))
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $s i32 (i32.const 0))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 264))
)
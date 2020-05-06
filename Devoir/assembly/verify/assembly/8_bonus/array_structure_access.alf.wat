
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
        ;; attribution
        ;; struct
        ;; array
        ;; variable list_of_schools
        i32.const 0
            ;; index
            ;; value int 1
            i32.const 1
            i32.const 264
            i32.mul
            i32.add
            ;; property private offset 256
            i32.const 256
            i32.add
        ;; value bool false
        i32.const 0
        i32.store
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 2376))
)
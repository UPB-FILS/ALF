
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
        ;; expression +
            ;; expression *
                ;; value int 2
                i32.const 2
                ;; value int 5
                i32.const 5
            i32.mul
            ;; value int 3
            i32.const 3
        i32.add
        ;; drop unused value (int)
        drop
        ;; expression +
            ;; value int 120
            i32.const 120
            ;; value character 0
            i32.const 48
            ;; typecast int character
        i32.add
        ;; drop unused value (int)
        drop
        ;; expression +
            ;; value string hello 
            global.get $strings_start
            i32.const 0
            i32.add
            i32.load
            ;; value string world
            global.get $strings_start
            i32.const 256
            i32.add
            i32.load
        i32.add
        ;; drop unused value (string)
        drop
    )
    
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 0))
    (data (i32.const 0) "\06hello ")
    (data (i32.const 256) "\05world")
)
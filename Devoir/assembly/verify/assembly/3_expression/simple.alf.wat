
(module
    ;; import functions
    (import "io" "writenstr" (func $writenstr
            (param $text i32)
        )
    )
    ;; import the memory space from io
    (import "io" "mem" (memory 1))
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    
    ;; global variables
    (global $n i32 (i32.const 0))
    (global $e i32 (i32.const 256))
    
    ;; function entry
    (func $entry
        (local $base_pointer i32)
        ;; attribution
        ;; variable n
        ;; alternative i32.const 0
        global.get $n
        ;; value string str
        global.get $strings_start
        i32.const 0
        i32.add
        ;; attribute string to string
        ;; set the number of words 64 (memory is aligned at 4 bytes)
        i32.const 64
        call $memcpy
        ;; attribution
        ;; variable e
        ;; alternative i32.const 256
        global.get $e
        ;; variable n
        ;; alternative i32.const 0
        global.get $n
        ;; attribute string to string
        ;; set the number of words 64 (memory is aligned at 4 bytes)
        i32.const 64
        call $memcpy
        ;; expression +
            ;; value int 2
            i32.const 2
            ;; value int 3
            i32.const 3
        i32.add
        ;; drop unused value (int)
        drop
        ;; writenstr (...)
        ;; parameter text
        ;; variable n
        ;; alternative i32.const 0
        global.get $n
        call $writenstr
    )
    
    (func $memcpy
        (param $to i32)
        (param $from i32)
        (param $len i32)
        block $memcpy_end
            loop $memcpy_begin
                local.get $len
                i32.const 1
                i32.sub
                local.tee $len
                i32.const 0
                i32.lt_s
                br_if $memcpy_end
                local.get $to
                local.get $len
                i32.add
                local.get $from
                local.get $len
                i32.add
                i32.load
                i32.store
                br $memcpy_begin
            end $memcpy_begin
        end $memcpy_end
    )
    ;; set the entry
    (start $entry)
    ;; strings
    (global $strings_start i32 (i32.const 512))
    (data (i32.const 512) "\03str")
)

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
        ;; variable str
        i32.const 0
        ;; value string string1
        global.get $strings_start
        i32.const 0
        i32.add
        i32.load
        ;; attribute string to string
        ;; set the number of words 64 (memory is aligned at 4 bytes)
        i32.const 64
        call $memcpy
        ;; value string string2
        global.get $strings_start
        i32.const 256
        i32.add
        i32.load
        ;; drop unused value (string)
        drop
        ;; value string string3
        global.get $strings_start
        i32.const 512
        i32.add
        i32.load
        ;; drop unused value (string)
        drop
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
    (global $strings_start i32 (i32.const 256))
    (data (i32.const 256) "\07string1")
    (data (i32.const 512) "\07string2")
    (data (i32.const 768) "\07string3")
)
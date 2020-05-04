
(module
    ;; import functions
    ;; define a memory
    (memory 1)
    ;; stack pointer
    (global $stack_pointer (mut i32) (i32.const 0))
    ;; base pointer
    (global $base_pointer (mut i32) (i32.const 0))
    
    
    ;; function script
    (func $script
        (local $n i32)
        (local $r f32)
        (local $l i32)
        ;; setup base pointer
        ;; store the old base pointer
        global.get $stack_pointer
        global.get $base_pointer
        i32.store
        ;; decrease $stack_pointer
        global.get $stack_pointer
        i32.const 4
        i32.add
        global.set $stack_pointer
        ;; set the new $base_pointer
        global.get $stack_pointer
        global.set $base_pointer
        ;; local variables
        global.get $stack_pointer
        i32.const 256
        i32.add
        global.set $stack_pointer
        ;; attribution
        ;; variable n
        ;; value int 3
        i32.const 3
        local.set $n
        ;; attribution
        ;; variable r
        ;; value real 3.7
        f32.const 3.7
        local.set $r
        ;; attribution
        ;; variable l
        ;; value bool false
        i32.const 0
        local.set $l
    )
    
    ;; set the entry
    (start $script)
    ;; constants
)
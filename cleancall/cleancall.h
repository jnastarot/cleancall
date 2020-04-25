#pragma once

#include <stdint.h>

namespace cleancall {

    typedef enum _cleancall_gate_type {

        SYSCALL_CALL_TYPE_UNKNOWN = 0,
        SYSCALL_CALL_TYPE_INT2E = 1, //for x32 or x64
        SYSCALL_CALL_TYPE_SYSENTER = 2, //for x32 only
        SYSCALL_CALL_TYPE_WOW64 = 3, //for x32 working in x64 system
        SYSCALL_CALL_TYPE_SYSCALL = 4  //for x64 only

    } cleancall_gate_type;

    cleancall_gate_type get_gate_type();
    void set_gate_type(cleancall_gate_type type);

    int32_t __stdcall call(uint32_t syscall_idx, uint32_t arg_count, ...);

};
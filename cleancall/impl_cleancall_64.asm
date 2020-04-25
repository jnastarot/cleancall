.CODE


internal_cleancall_native_int2e PROC

sub rsp, 020h ; save regs
mov [rsp],        rsi
mov [rsp + 8],    rdi
mov [rsp + 010h], rbx
mov [rsp + 018h], r12

mov eax,  ecx ; syscall index 
mov esi,  edx ; params count
mov rdi,  r8  ; param table

cmp rsi, 0
je  make_call

mov rcx, [rdi] ;fill 1st arg
add rdi, 8

dec rsi
je  make_call

mov rdx, [rdi] ;fill 2st arg
add rdi, 8

dec rsi
je  make_call

mov r8, [rdi] ;fill 3st arg
add rdi, 8

dec rsi
je  make_call

mov r9, [rdi] ;fill 4st arg
add rdi, 8

dec rsi
je  make_call

lea rbx, [rsi * 8]
sub rsp, rbx  ;if more we push it on stack
mov rbx, 0 

push_argument:
 mov r12, [rdi]
 mov [rsp + rbx], r12
 add rbx, 8
 add rdi, 8
 dec rsi
 jnz push_argument

make_call:

sub rsp, 028h

mov r10, rcx 
int 02eh

add rsp, 028h
add rsp, rbx

mov r12, [rsp + 018h] 
mov rbx, [rsp + 010h]
mov rdi, [rsp + 8]
mov rsi, [rsp]

add rsp, 20h

ret

internal_cleancall_native_int2e ENDP


internal_cleancall_native_syscall PROC


sub rsp, 020h ; save regs
mov [rsp],        rsi
mov [rsp + 8],    rdi
mov [rsp + 010h], rbx
mov [rsp + 018h], r12

mov eax,  ecx ; syscall index 
mov esi,  edx ; params count
mov rdi,  r8  ; param table

cmp rsi, 0
je  make_call

mov rcx, [rdi] ;fill 1st arg
add rdi, 8

dec rsi
je  make_call

mov rdx, [rdi] ;fill 2st arg
add rdi, 8

dec rsi
je  make_call

mov r8, [rdi] ;fill 3st arg
add rdi, 8

dec rsi
je  make_call

mov r9, [rdi] ;fill 4st arg
add rdi, 8

dec rsi
je  make_call

lea rbx, [rsi * 8]
sub rsp, rbx  ;if more we push it on stack
mov rbx, 0 

push_argument:
 mov r12, [rdi]
 mov [rsp + rbx], r12
 add rbx, 8
 add rdi, 8
 dec rsi
 jnz push_argument

make_call:

sub rsp, 028h

mov r10, rcx 
syscall

add rsp, 028h
add rsp, rbx

mov r12, [rsp + 018h] 
mov rbx, [rsp + 010h]
mov rdi, [rsp + 8]
mov rsi, [rsp]

add rsp, 20h

ret

internal_cleancall_native_syscall ENDP


END
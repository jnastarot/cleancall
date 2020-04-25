.686 
.XMM 
.MODEL flat, c 
ASSUME fs:_DATA 
.CODE

EXTERN internal_cleancall_wow64_gate: PROC

internal_cleancall_native_int2e PROC

mov eax, [esp + 4]   ; syscall idx from param  
lea edx, [esp + 0Ch] ; arguments table
int 02Eh
ret

internal_cleancall_native_int2e ENDP


internal_cleancall_native_sysenter PROC

push ebp
mov ebp, esp

mov ecx, [ebp + 0Ch]  ; arguments count
mov edx, [ebp + 010h] ; arguments table

test ecx, ecx
jz make_call

push_argument:
 dec ecx
 push [edx + ecx * 4]
 jnz push_argument

make_call:
mov eax, [ebp + 8] ; syscall idx from param

push ret_address_epilog

call do_sysenter_interupt
lea esp, [esp+4]

ret_address_epilog:
mov esp, ebp
pop ebp

ret

do_sysenter_interupt:

mov edx, esp

sysenter

ret

internal_cleancall_native_sysenter ENDP


internal_cleancall_WOW64 PROC

push ebp
mov ebp, esp

mov ecx, [ebp + 0Ch]  ; arguments count
mov edx, [ebp + 010h] ; arguments table

test ecx, ecx
jz make_call

push_argument:
 dec ecx
 push [edx + ecx * 4]
 jnz push_argument

make_call:
mov eax, [ebp + 8] ; syscall idx from param

push ret_address_epilog

call dword ptr internal_cleancall_wow64_gate ; call KiFastSystemCall
lea esp, [esp+4]

ret_address_epilog:

mov esp, ebp
pop ebp

ret

internal_cleancall_WOW64 ENDP

END
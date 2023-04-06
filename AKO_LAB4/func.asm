.686
.model flat
public _getRam
public _fib
EXTERN _GetPhysicallyInstalledSystemMemory@4 :PROC
.data
.code
_getRam PROC
	;rezerwacja miejsca na stosie
	sub esp, 8
	mov esi, esp

	push esi
	call _GetPhysicallyInstalledSystemMemory@4
	
	mov ecx,dword ptr [esi]
	mov eax, 1024			;konwersja z mb do kb _1
	xor edx,edx				;zerowanko aby wynik by³ git
					
	mul ecx					;konwersja z mb do kb _2

	add esp,8
	ret
_getRam ENDP

_fib PROC
	push ebp
	mov ebp, esp
	push ebx
	push edx
	xor edx,edx				;edx jako suma 

	mov eax, [ebp + 8]		;zczytywanie k
	cmp eax, 1				;fab(1) = 1
	jz ret1
	cmp eax, 2				;fab(2) = 1
	jz ret1
	cmp eax, 47				;fab(k>47) = -1
	jg ret47

	mov ebx,eax
	
	dec ebx
	push ebx
	call _fib ;fib(x-1)
	add esp, 4

	add edx,eax

	dec ebx
	push ebx
	call _fib ;fib(x-2)
	add esp, 4

	add edx,eax
	mov eax,edx

	return:
	pop edx
	pop ebx
	pop ebp
	ret

	ret1:
	mov eax, 1
	jmp return

	ret47:
	mov eax, -1
	jmp return
_fib ENDP
END
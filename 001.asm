.global _start
.intel_syntax
.section .text

_start:	
	# read syscall
	mov %eax, 3 # syscall num for sys_read
	mov %ebx, 0 # file desc for stdin
	lea %ecx, [buffer] # pointer to buffer
	mov %edx, 255 # max bytes to read
	int 0x80

	# save the length of read input
	mov %edi, %eax

	# write syscall
	mov %eax, 4 # syscall num for sys_write
	mov %ebx, 1 # file desc for stdout
	lea %ecx, [buffer] # pointer to our buffer
	mov %edx, %edi # saved length from sys_read
	int 0x80

	# exit syscall
	mov %eax, 1 # syscall num for sys_exit
	xor %ebx, %ebx # exit status
	int 0x80


.section .data
	buffer: .space 256

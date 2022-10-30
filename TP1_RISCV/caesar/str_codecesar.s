#Code de César en riscv
# CE313, binôme : CHOGNOT LAFAGE
.section .text
.globl main
main:
    addi    sp,sp,-16
    sd  ra, 8(sp)
# Your assembly code there
    


# Data comes here
	.section	.data
strings:
	.string "Hello world!"
#Code de César en riscv
# CE313, binôme : CHOGNOT LAFAGE
.section .text
.globl main
main:
    addi    sp,sp,-16
    sd  ra, 8(sp)
# Your assembly code there
    # Chargement de l'adresse de début de chaine dans a0
    la t0, chaine
    mv a0, t0
    #Chargement de l'adresse de debut de la nouvelle chaine dans a3
    la t3, chaineEncodee
    mv a3, t3
    #Chargement de dec dans a2
    la t2, dec
    ld a2, 0(t2)
    call println_string
    call cesar
    mv a0, t5
    call println_string
## end of user assembly code
	ld	ra,8(sp)
	addi	sp,sp,16
        ret

cesar:
    mv t5, t3  #Sauvegarde de l'adresse de début de la nouvelle chaine dans t5
loop:
    lb  t2, 0(t0)   #Charge le caractère de la chaine dans t2
    beq t2, zero, end   #Si c'est 0 on est en fin de chaine : on arrete
    add t2, t2, a2   #Incrémente le caractère de dec (stocké dans a2)
    sb  t2, 0(t3)   #Charge le nouveau caractère dans chaineEncodee
    addi t3, t3, 1   #Incrémentate l'indice de chaineEncodee
    addi t0, t0, 1   #Incrémentate l'indice de chaine
    j loop
end:
    ret


# Data comes here
	.section	.data
chaine:
	.string "Hello world!"
chaineEncodee: #Espace mémoire réservé pour contenir la nouvelle chaine
    .space 64
dec:
    .dword 4

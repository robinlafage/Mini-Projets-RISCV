# Programme pour ajouter 1 à chacune des cases d'un tableau
# 
	.globl main
main:
        addi	sp,sp,-16
	sd	ra,8(sp)
## TODO Your assembly code there
	# chargement de l'adresse de début de tableau dans a0
	la t2,tab
	mv a0, t2
	# et contenu au label len dans a1
	la t1, len
	ld a1, 0(t1)
	call arrayinc
	# pour vérifier on peut regarder le contenu à la case numéro 3
	la t2, tab # t2 a été écrasé durant la routine
	mv a0, t6
	call print_int
	call newline
## end of user assembly code
	ld	ra,8(sp)
	addi	sp,sp,16
        ret

# routine d'ajout
# l'appel dans le main n'est pas demandé dans l'exo du TD1
	#a0 contient l'adresse de début et a1 la taille
arrayinc:
	mv t3, a1 # t3 est la taille
	mv t4, zero # compteur de boucle
    mv t6, zero
	mv t5, a0 #compteur d'adresse (on inc de 8 à chaque tour)
loop:
	beq t4, t3, end	# si égalité, alors c'est fini
	# on calcule la nouvelle valeur
    ld  t2, 0(t5)
	add t6, t6, t2
	# la suite est pour réaliser la boucle de parcours
	addi t4, t4, 1 # incrémentation du compteur
	mv a0, t4
	addi t5, t5, 8 # incrémentation du pointeur (+64 bits)
	j loop
end:	
	ret
	
	.section .data
len:
	.dword 4
tab:
	.dword 7
	.dword -1
	.dword 12
	.dword 41

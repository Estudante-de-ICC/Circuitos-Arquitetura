.data
	meuArray1:
		.align 2
		.space 64
	meuArray2:
		.align 2
		.space 64
	resultado:
		.align 2
		.space 64
	linhaNova:
		.asciiz "\n"
		
.text
	
	li $s1, 0 #Índice I 
	li $t0, 1 #Valor a ser incrementado em cada elemento da matriz
	
	li $t1, 4 #Aqui representa os limites pra I e J
	
	for_de_i:
		beq $s1, $t1, fim_de_i
		li $s2, 0
		
	for_de_j:
		beq $s2, $t1, fim_de_j
		
		sll $t3, $s1, 4
		sll $t4, $s2, 2
		add $t3, $t3, $t4
		
		sw $t0, meuArray1($t3)
		sw $t0, meuArray2($t3)
		addi $t0, $t0, 1
		addi $s2, $s2, 1
		
		j for_de_j
		
	fim_de_j:
		addi $s1, $s1, 1
		j for_de_i
	
	fim_de_i:
	
	li $s1, 0 #Índice I 
	li $t0, 1 #Valor a ser incrementado em cada elemento da matriz
	li $t1, 4 #Aqui representa os limites pra I e J
	for_p_i:
		beq $s1, $t1, fim_p_i
		li $s2, 0 #Índice J
	for_p_j:
		beq $s2, $t1, fim_p_j
		li $s3, 0 #Índice K
	for_p_k:
		beq $s3, $t1, fim_p_k
		sll $t3, $s1, 4
		sll $t4, $s2, 2
		add $t3, $t3, $t4 # T3 e T4 para preencher a matriz resultado 
		sll $t5, $s1, 4
		sll $t6, $s3, 2
		add $t5, $t5, $t6 #T5 e T6 para a matriz 1 
		sll $t7, $s3, 4
		sll $s4, $s2, 2
		add $t7, $t7, $s4 # T7 e S4 para a matriz 2
		lw $s5, meuArray1($t5)
		lw $s6, meuArray2($t7)
		mul $s6, $s6, $s5
		lw $s7, resultado($t3)
		add $s7, $s7, $s6
		sw $s7, resultado($t3)
		addi $s3, $s3, 1
		j for_p_k
	fim_p_k:
		addi $s2, $s2, 1
		j for_p_j
	
	fim_p_j:
		addi $s1, $s1, 1
		j for_p_i
	
	fim_p_i:

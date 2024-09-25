def da_boas_vindas
	puts "Jogo da adivinhação"
	puts "Qual o seu nome?"
	nome = gets.strip
	puts "\n\n\n\n"
	puts "Começaremos o jogo para você, #{nome}"  
	nome
end

def pede_dificuldade
	puts "Qual o nivel de dificuldade que deseja? (1 facil, 5 dificil)"
	dificuldade = gets.to_i
end

def sorteira_numero_secreto(dificuldade)
	case dificuldade
	when 1
		maximo = 30
	when 2
		maximo = 60
	when 3
		maximo = 100
	when 4
		maximo = 150
	else 
		maximo = 200
	end

	puts "Escolhendo um numero secreto entre 1 a #{maximo -1}..."
	sorteado = rand(maximo) + 1
	puts "Número escolhido.... Que tal adivinhar o número secreto?"
	sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
	puts "Tentativa número #{tentativa} de #{limite_de_tentativas}"
	puts "chutes ate agora" + chutes.to_s
	puts "Entre com um número"
	chute = gets
	puts "\n"
	puts "Será que voce acerto? voce chutou " + chute
	chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
	acertou = numero_secreto == chute
	if acertou
		puts "Acertou!"
		return true
	end
	
	maior = numero_secreto > chute
	if maior
		puts "O número secreto é maior"
	else
		puts "O número secreto é menor"
	end
	false
end

def joga(nome, dificuldade)
	numero_secreto = sorteira_numero_secreto(dificuldade)
	pontos_ate_agora = 1000
	chutes = []
	total_de_chutes = 0
	limite_de_tentativas = 5

	for tentativa in 1..limite_de_tentativas
		chute = pede_um_numero chutes, tentativa, limite_de_tentativas
		chutes << chute

		if nome == "Kaique"
			puts "acertou!"
			break
		end

		pontos_a_perder = (chute - numero_secreto).abs / 2.0
		pontos_ate_agora  -= pontos_a_perder

		break if verifica_se_acertou numero_secreto, chute
	end

	puts "Voce ganhou #{pontos_ate_agora} pontos."
end

def quer_jogar
	puts "Deseja jogar novamente? (S/N)"
	quer_jogar = gets.strip
	quer_jogar == "S"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
	joga nome, dificuldade
	if !quer_jogar
		break
	end
end

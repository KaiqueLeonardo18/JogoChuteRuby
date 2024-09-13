puts "Jogo da adivinhação"
puts "Qual o seu nome?"
nome = gets

puts "\n\n\n\n"

puts "Começaremos o jogo para você, " + nome
puts "Escolhendo um numero secreto entre 0 a 200"
numero_secreto = 175
puts "Número escolhido.... Que tal adivinhar o número secreto?"

puts "\n\n\n\n"
limite_de_tentativas = 5
for tentativa in 1..limite_de_tentativas
	puts "Tentativa número " + tentativa.to_s + " de " + limite_de_tentativas.to_s
	puts "Entre com um número"
	chute = gets
	puts "\n"
	puts "Será que voce acerto? voce chutou " + chute
	acertou = chute.to_i == numero_secreto
	if acertou
		puts "Acertou!"
		break
		puts "\n"
	else
		maior = numero_secreto > chute.to_i
		if maior
			puts "O número secreto é maior"
			puts "\n"
		else
			puts "O número secreto é menor"
			puts "\n"
		end
	end
end
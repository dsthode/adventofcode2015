input = File.read('input1.txt')
floor = 0
counter = 1
input.each_char do |c|
	case c
	when '('
		floor += 1
	when ')'
		floor -= 1
	end
	puts "Planta -1 en #{counter}" if floor == -1
	counter += 1
end
puts "Planta final: #{floor}"

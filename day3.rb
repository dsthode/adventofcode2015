input = File.read(ARGV[0])
santa_moves = true
santa_x = 0
santa_y = 0
robo_x = 0
robo_y = 0
next_x = 0
next_y = 0
counter = 0
presents = {}
presents["#{next_x}_#{next_y}"] = 2
input.each_char do |char|
	case char
	when '^'
		if santa_moves
			santa_y += 1
		else
			robo_y += 1
		end
	when '<'
		if santa_moves
			santa_x -= 1
		else
			robo_x -= 1
		end
	when '>'
		if santa_moves
			santa_x += 1
		else
			robo_x += 1
		end
	when 'v'
		if santa_moves
			santa_y -= 1
		else
			robo_y -= 1
		end
	end
	if santa_moves
		next_x = santa_x
		next_y = santa_y
	else
		next_x = robo_x
		next_y = robo_y
	end
	presents["#{next_x}_#{next_y}"] = 0 if presents["#{next_x}_#{next_y}"].nil?
	presents["#{next_x}_#{next_y}"] += 1
	counter += 1
	santa_moves = (counter % 2) == 0
end
puts "Number of houses reached: #{presents.size}"

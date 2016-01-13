def get_pairs(x1, y1, x2, y2)
	pairs = []
	(x1.to_i..x2.to_i).each do |x|
		(y1.to_i..y2.to_i).each do |y|
			pairs << [x,y]
		end
	end
	return pairs
end

input = File.read(ARGV[0])
display = Array.new(1000) { Array.new(1000, false) }
turn_on_off_regex = /turn (on|off) (\d{0,3}),(\d{0,3}) through (\d{0,3}),(\d{0,3})/
toggle_regex = /toggle (\d{0,3}),(\d{0,3}) through (\d{0,3}),(\d{0,3})/
count = 0
input.lines.each do |line|
	if matches = turn_on_off_regex.match(line)
		pairs = get_pairs(matches[2], matches[3], matches[4], matches[5])
		pairs.each do |pair|
			display[pair[0], pair[1]] = (matches[1] == 'on') ? true : false
		end
	elsif matches = toggle_regex.match(line)
		pairs = get_pairs(matches[1], matches[2], matches[3], matches[4])
		pairs.each do |pair|
			display[pair[0], pair[1]] = !display[pair[0], pair[1]]
		end
	end
end

(0..999).each do |x|
	(0..999).each do |y|
		count += 1 if display[x, y]
	end
end

puts "Total lights on: #{count}"

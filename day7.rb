input = File.read(ARGV[0])

assign_regex = /(\d+) -> ([a-z]+)/
op_regex = /([a-z]+) (AND|OR) ([a-z]+) -> ([a-z]+)/
shift_regex = /([a-z]+) (LSHIFT|RSHIFT) (\d+) -> ([a-z]+)/
not_regex = /NOT ([a-z]+) -> ([a-z]+)/

signals = {}

input.lines.each do |line|
	if matches = assign_regex.match(line)
		signals[matches[2]] = matches[1].to_i
	elsif matches = op_regex.match(line)
		case matches[2]
		when 'AND'
			signals[matches[4]] = signals[matches[1]] & signals[matches[3]]
		when 'OR'
			signals[matches[4]] = signals[matches[1]] | signals[matches[3]]
		end
	elsif matches = shift_regex.match(line)
		case matches[2]
		when 'LSHIFT'
			signals[matches[4]] = signals[matches[1]] << signals[matches[3]].to_i
		when 'RSHIFT'
			signals[matches[4]] = signals[matches[1]] >> signals[matches[3]].to_i
		end
	elsif matches = not_regex.match(line)
		puts "Matches: #{matches[1]} #{matches[2]} #{signals[matches[1]]} #{signals[matches[2]]}"
		signals[matches[2]] = ~ signals[matches[1]]
	else
		puts "No match!: #{line}"
		exit
	end
end

puts "Value of 'a' signal is: #{signals['a']}"

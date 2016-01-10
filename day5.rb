input = File.read(ARGV[0])
regex_must_1 = /[aeiou][a-zA-Z]*[aeiou][a-zA-Z]*[aeiou]/
regex_must_2 = /([abcdefghijklmnopqrstuvwxyz])\1/
regex_must_not_1 = /ab|cd|pq|xy/
matches = 0
input.lines.each do |line|
	if line =~ regex_must_1 and
		line =~ regex_must_2 and
		not (line =~ regex_must_not_1)
			matches += 1
	end
end
puts "Number of matches in 1st step: #{matches}"

regex_must_1 = /([a-z][a-z])[^\1]/
regex_must_2 = /([a-z])[a-z]\1/
matches = 0
input.lines.each do |line|
	if line =~ regex_must_1 and
		line =~ regex_must_2
			matches += 1
	end
end
puts "Number of matches in 2nd step: #{matches}"

input = File.read(ARGV[0])
totalsq = 0
totalribbon = 0
input.lines.each do |current|
	dims = current.split('x')
	side1 = dims[0].to_i * dims[1].to_i
	side2 = dims[0].to_i * dims[2].to_i
	side3 = dims[1].to_i * dims[2].to_i
	minside = [side1, side2, side3].min
	totalsq += 2*side1 + 2*side2 + 2*side3 + minside
	minperimeter = [2*dims[0].to_i + 2*dims[1].to_i,
								 2*dims[0].to_i + 2*dims[2].to_i,
								 2*dims[1].to_i + 2*dims[2].to_i].min
	totalribbon += dims[0].to_i * dims[1].to_i * dims[2].to_i + minperimeter
end
puts "Total wrapping is #{totalsq} and total ribbon is #{totalribbon}"

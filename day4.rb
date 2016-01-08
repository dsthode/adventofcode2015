require 'digest'
input = ARGV[0]
counter = 0
counter1st = 0
counter2nd = 0
found1st = false
found2nd = false
done = false
while not done
	counter += 1
	hash = Digest::MD5.hexdigest "#{input}#{counter.to_s}"
	(found1st = (hash =~ /^00000/) != nil) if not found1st
	counter1st = counter if (counter1st == 0 and found1st)
	(found2nd = (hash =~ /^000000/) != nil) if not found2nd
	counter2nd = counter if (counter2nd == 0 and found2nd)
	done = (found1st and found2nd)
end
puts "Minimum number found 1st round: #{counter1st.to_s}"
puts "Minimum number found 2nd round: #{counter2nd.to_s}"

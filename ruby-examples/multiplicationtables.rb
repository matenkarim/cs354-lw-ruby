x = 1
y = 1

(1..x).each do |a|
    (1..y).each do |b|
        print "#{a * b} "
    end
    puts ""
end
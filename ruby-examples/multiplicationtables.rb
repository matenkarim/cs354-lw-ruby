# Ruby IO example:
# @author Team Halibut
# In Ruby, IO is built directly into the language itself (no imports needed).

puts "What's your name?"
# gets grabs user input and .chomp removes any trailing newlines
userName = gets.chomp
puts "Hello, #{userName}! Nice to meet you."
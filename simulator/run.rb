require_relative "../lib/pawn.rb"

puts "Welcome to Pawn Stimulator"

player = Pawnruby::Play.new

puts "\n >> PLEASE USE THE VALID COMMANDS << \n\n"
puts "\n ==> RIGHT, LEFT, MOVE, REPORT, PLACE, COLOR \n\n"

loop do
  puts "\n\n\n => Type a new command:"
  puts player.get_move(gets.chomp)
end

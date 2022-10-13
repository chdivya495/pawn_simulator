lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/pawn/**/*.rb"].each { |file| require file }

module Pawnruby
end
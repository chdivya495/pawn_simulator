module Pawnruby
  class Play

    attr_reader :pawn, :name, :parser, :color
    # saving command issued by human in order
    # to be able to create a kind of "reverse" method in the future
    attr_accessor :command, :command_x, :command_y, :command_f, :command_c

    def initialize(options={})
      @board  =  options[:board] || Pawnruby::Board.new
      @pawn  =  options[:pawn] || Pawnruby::Pawn.new({board: @board, compass: @compass})
      @parser =  Parser.new
      @color  =  options[:color] || object_id
      @name   =  options[:name] || object_id
      @command, @command_x, @command_y, @command_f = :report, 0, 0, 0, 0
      @allowed_actions = pawn.methods(false)
    end

    def get_move(cmd)
      @command, @command_x, @command_y, @command_f, @current_c = parser.parse(cmd)
      pawn.send(@command, @command_x.to_i, @command_y.to_i, @command_f.to_i, @current_c.to_s)
    end

  end
end

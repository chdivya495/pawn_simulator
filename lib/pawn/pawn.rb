module Pawnruby
  class Pawn

    attr_reader :board, :compass, :current_x, :current_y, :direction, :current_c

    def initialize(options={})
      @board   = options[:board]   || Pawnruby::Board.new
      @compass = options[:compass] || Compass.new
      @current_x, @current_y, @direction, @current_c  = 0, 0, 0, 0 # direction 0 means north
    end

    
    def place(x,y, direction, c)
      if can_i_move?(x,y)
        @current_x = x
        @current_y = y
        @direction = direction 
        @current_c = c
        report 
      else
        "Attempt to move into an invalid position"
      end
    end

    # move a step into the current direction
    def move(*_)
      dir       = compass.grad_to_direction(direction)
      new_value = compass.direction[dir.to_sym]

      place(current_x + new_value[:x], current_y + new_value[:y], direction, current_c )
    end

    # rotate right
    def right(*_)
      new_direction = compass.rotate :right

      place(current_x, current_y, direction + new_direction, current_c)
    end

    # rotate left
    def left(*_)
      new_direction = compass.rotate :left
      
      place(current_x, current_y, direction + new_direction, current_c)
    end

    # print x,y, direction
    def report(*_)
      [current_x, current_y, compass.grad_to_direction(direction).to_s.upcase, current_c.to_s.upcase ]
    end

    def quit(*_)
      exit! # so you can close the game
    end

    # return true if the attemped new x,y is in the array of valid coordinates
    def can_i_move?(x, y)
      x, y = x.to_i, y.to_i
      ( x >= 0 && x <= board.width  ) && ( y >= 0 && y <= board.height )
    end

    def method_missing(undefined_meth_yet,*args,&block)
      "#{self.class.to_s} doesn't know how to perform :#{undefined_meth_yet}"
    end

  end
end

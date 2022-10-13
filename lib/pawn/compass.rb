module Pawnruby
  class Compass

    # Add or remove 90 deg depending on the rotation
    def rotate(side)
      send(side)
    end

    # Translate the coors into a human direction
    # We are using a case statement as for now the directions are limited
    def grad_to_direction(grads)      
      angle = to_quadrant(grads)
      case angle
      when 0, 360   then :north
      when 1..89    then :northeast
      when 90       then :east
      when 91..179  then :southeast
      when 180      then :south
      when 181..269 then :southwest
      when 270      then :west
      when 271..359 then :northwest
      else raise "Something went wrong, the angle provided was: #{angle}"
      end
    end

    
    def direction_to_grads(direction)
      case direction.to_s.downcase.to_sym
      when :north     then 0
      
      when :east      then 90
      
      when :south     then 180
      
      when :west      then 270
      
      else raise "Don't know how to move in direction #{direction}"
      end
    end

    # Translate an Integer into an angle in a 360° quadrant
    def to_quadrant(grads)
      Integer(grads) % 360 # if the rotation in grads is a number convert it a respective angle
    end

    def left
      -90
    end

    def right
      +90
    end

   
    def direction
      directions_list
    end

    # The Compass will complain if he doesn't know a direction
    def method_missing(undefined_meth_yet,*args,&block)
      raise "direction #{undefined_meth_yet} not implemented yet, define it in #{__FILE__}"
    end

    private

    def directions_list
      {
        :south => {
          :x => 0,
          :y => -1,
        }.freeze, # damn Ruby!
        :southeast => {
          :x => 1,
          :y => -1,
        }.freeze, # damn Ruby!
        :north => {
          :x => 0,
          :y => 1,
        }.freeze, # damn Ruby!
        :northeast => {
          :x => 1,
          :y => 1,
        }.freeze, # damn Ruby!
        :east => {
          :x => 1,
          :y => 0,
        }.freeze, # damn Ruby!
        :west => {
          :x => -1,
          :y => 0,
        }.freeze, # damn Ruby!
        :southwest => {
          :x => -1,
          :y => -1,
        }.freeze, # damn Ruby!
        :northwest => {
          :x => -1,
          :y => 1,
        }.freeze # damn Ruby!
      }.freeze # damn Ruby again!
    end

  end
end

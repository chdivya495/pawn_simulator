module Pawnruby
  class Parser
    # bad design, you can't really re-use the code below. Needs improvements
    
    def parse(cmd)
      @to_execute = []
      cmd = cmd.split
      extract_command!(cmd[0])
      extract_arguments!(cmd[1])
      @to_execute.to_a
    end

    def extract_command!(cmd)
      command = cmd.to_s.downcase.to_sym
      @to_execute.push(command)
    end

    def extract_arguments!(args)
      return if args.nil?    
      args = args.split(",")  
      x, y, f, c = args[0].to_i, args[1].to_i, args[2], args[3]
      #the helper function to convert the string into an angle (i.e. north => 0)
      direction = Compass.new.direction_to_grads(f)
      @to_execute.push(x, y, direction, c)
    end

  end
end
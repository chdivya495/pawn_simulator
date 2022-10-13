require 'spec_helper'

module Pawnruby
  describe Play do

    let!(:pawn) { Pawnruby::Pawn.new }
    let!(:play) { Play.new({pawn: pawn}) }
    let!(:board) { Pawnruby::Board.new  }
    let!(:valid_commands) { %w(RIGHT LEFT REPORT PLACE) }
    let!(:not_valid_commands) { %w(ciccio probldldjd eskudzbj qwsjdhbqwja sjsaddsajh ashdh hh) }

    it "should be a Pawn module" do
      expect(Play).to be Pawnruby::Play
    end

    it "should start the Pawn and initiate the table" do
      expect(play.pawn).to be pawn
    end

    context "#initialize" do
      it "should initialize the pawn with a custom board" do
        pawn = Pawnruby::Pawn.new({board: board})
        play = Play.new({pawn: pawn})
        expect(play.pawn.board.object_id).to be board.object_id
      end
    end
    context "#get_move with valid commands" do

      it "converts human_move of 'RIGHT'  to right" do
        play.get_move('RIGHT')
        expect(play.pawn.report).to eq [0, 0, "EAST", "0"]
      end

      it "converts human_move of 'LEFT'  to left" do
        play.get_move('LEFT')
        expect(play.pawn.report).to eq [0, 0, "WEST", "0"]
      end

      it "converts human_move of 'REPORT' to report" do
        expect(play.get_move('REPORT')).to eq [0, 0, "NORTH", "0"]
      end

      it "converts human_move of 'PLACE X,Y,F,C' to place(x,y,f,c)" do
        play.get_move('PLACE 2,3,NORTH,WHITE')
        expect(play.pawn.report).to eq [2, 3, "NORTH", "WHITE"]
      end

      it "converts MOVE to move" do
        play.get_move('PLACE 0,0,NORTH,WHITE')
        play.get_move('MOVE')
        expect(play.pawn.report).to eq [0, 1, "NORTH", "WHITE"]
        #Output: 0,1,NORTH
      end
    end

    context "#get_move with valid commands" do
      it "should return false" do
        not_valid_commands.each do |c|
          expect(play.get_move(c)).to include "doesn't know how to perform"
        end
      end
    end

    context "Do the demo set of commands from Specs" do
      it "example a)" do
        play.get_move('PLACE 0,0,NORTH,WHITE')
        play.get_move('MOVE')
        expect(play.pawn.report).to eq [0, 1, "NORTH", "WHITE"]
        #Output: 0,1,NORTH
      end
      it "example b)" do
        play.get_move('PLACE 0,0,NORTH,WHITE')
        play.get_move('LEFT')
        expect(play.pawn.report).to eq [0, 0, "WEST","WHITE"]
        #Output: 0,0,WEST
      end
      it "example c)" do
        play.get_move('PLACE 1,2,EAST,WHITE')
        play.get_move('MOVE')
        play.get_move('MOVE')
        play.get_move('LEFT')
        play.get_move('MOVE')
        expect(play.pawn.report).to eq [3, 3, "NORTH", "WHITE"]
        #Output: 3,3,NORTH
      end
      
    end
  end
end

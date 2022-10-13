require 'spec_helper'

module Pawnruby
  describe Board do
    let!(:board) { Pawnruby::Board.new }
    context "#initialize" do
      it "should be a Pawn module" do
        expect(Board).to be Pawnruby::Board
      end
      it "have x and y by default" do
        expect(board.width).to be 8
        expect(board.height).to be 8
      end
    end

    context "#initialize with options" do
      it "should initialize the options" do
        width, height, origin = rand(0..100), rand(0..100), rand(0..100)
        board_with_options = Pawnruby::Board.new({width: width, height: height, origin: origin })
        expect(board_with_options.width).to be width
        expect(board_with_options.height).to be height
      end
    end

  end
end

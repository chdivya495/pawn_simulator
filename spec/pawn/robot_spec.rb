require 'spec_helper'

module Pawnruby
  describe Pawn do

    let!(:pawn) { Pawnruby::Pawn.new }
    let!(:compass) { Pawnruby::Compass.new }
    
    it "should be a pawn module" do
      expect(Pawn).to be Pawnruby::Pawn
    end

    context "#initialize" do

      it "is expected to be itialized with the position 0x0 by default" do
        new_pawn = Pawnruby::Pawn.new
        expect(new_pawn.report).to eq [0, 0, "NORTH", "0"]
      end

      it "is expected to be itialized with the position 0x0 by default" do
        expect(pawn.report).to eq([0, 0, "NORTH", "0"])
      end

      it "is expected to be itialized a default board" do
        expect(pawn.board).to_not be nil
      end

      it "is expected to be itialized a custom board" do
        board = Pawnruby::Board.new({width: 10, height: 4, origin: 1})
        pawn = Pawnruby::Pawn.new({board: board})
        expect(pawn.board.width).to be 10
        expect(pawn.board.height).to be 4
      end

    end

    context "#set cell" do
      it "sets the value of cell based on the (x, y) coordinates" do
        expect(pawn.place(2,2,0,0)).to eq([2, 2, "NORTH", "0"])
      end

      it "should set the new position of the pawn" do
        pawn.place(2,2, 0, 0)
        expect(pawn.report).to eq [2, 2, "NORTH", "0"]
      end

    end

    context "#current x and current y" do
      it "returns the current x" do
        expect(pawn.current_x).to be(0)
      end

      it "should also set the new position of the pawn" do
        expect(pawn.current_y).to be(0)
      end
    end

    context "#current x and current y" do
      it "returns the current x" do
        expect(pawn.current_x).to be(0)
      end

      it "should also set the new position of the pawn" do
        expect(pawn.current_y).to be(0)
      end
    end

    # TODO don't hardcore the output but read it directly from the map
    context "#move right" do
      it "should rotate the pawn 90 degrees in the specified direction without changing the position" do
        pawn.right
        expect(pawn.report).to eq([0, 0, "EAST", "0"])
      end
    end
    # TODO don't hardcore the output but read it directly from the map
    context "#move left" do
      it "should rotate the pawn 90 degrees in the specified direction without changing the position" do
        pawn.left
        expect(pawn.report).to eq([0, 0, "WEST", "0"])
      end

      it "should rotate the pawn 360 degrees in the specified direction without changing the position" do
        4.times do
          pawn.left
        end
        expect(pawn.report).to eq([0, 0, "NORTH", "0"])
      end

      it "should rotate the pawn 360 degrees 100 times" do
        400.times do
          pawn.left
        end
        expect(pawn.report).to eq([0, 0, "NORTH", "0"])
      end

      it "should rotate the pawn 360 degrees 100 times and one to the right" do
        400.times do
          pawn.left
        end
        pawn.right
        expect(pawn.report).to eq([0, 0, "EAST", "0"])
      end
    end

    context "#move" do

      it "should return true" do
        pawn.place(0,0, 0, 0)
        expect(pawn.move).to eq([0, 1, "NORTH", "0"])
      end

      it "should move the pawn one position further in the direction it is now" do
        pawn.place(0,0, 0, 0)
        pawn.move
        expect(pawn.report).to eq [0, 1, "NORTH", "0"]
      end

      it "should not move the pawn if the movement make it fall from the table" do
        pawn.place(0,0, 180, 0)
        expect(pawn.move).to eq("Attempt to move into an invalid position")
      end
    end

    context "#is in the grid?" do
      it "should be in the grid by default" do
        new_pawn = Pawnruby::Pawn.new
        is_inside = new_pawn.can_i_move?(new_pawn.current_x, new_pawn.current_y)
        expect(is_inside).to eq(true)
      end

    end
  end
end

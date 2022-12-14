require 'spec_helper'

module Pawnruby
  describe Compass do
    subject { Compass.new }
    context "#initialize" do
      it "should be a Pawn module" do
        expect(Compass).to be Pawnruby::Compass
      end
    end

    context "#movements should return the new position of the Pawn" do
      context "#move direction different directions" do
        it "down" do
          expect(subject.direction[:south]).to eq ({:x=>0, :y=>-1})
        end
        it "up" do
          expect(subject.direction[:north]).to eq ({:x=>0, :y=>1})
        end
        it "right" do
          expect(subject.direction[:west]).to eq ({:x=>-1, :y=>0})
        end
        it "left" do
          expect(subject.direction[:east]).to eq ({:x=>1, :y=>0})
        end
      
      end

      context "right/left" do
        it "move left/right when poiting in one direction" do
          expect(subject.rotate(:left)).to eq(-90)
          expect(subject.rotate(:right)).to eq(90)
        end
       
      end
    end

    context "#in_quadrant" do
      it "should reduce to < 360 any grad above 360" do
        expect(subject.to_quadrant(380)).to eq 20
      end
      it "should return the error when the operation can't be done" do
        expect{subject.to_quadrant("passing a string as argument")}.to raise_error ArgumentError
      end
      it "should support also Bignum" do 
        expect(subject.to_quadrant(1000000000000000000000000 * 1000000000000000000000000)).to eq 280
      end
    end

    context "#to_direction" do
      it "should return the direction looking at what part of the grad are" do
        expect(subject.grad_to_direction(0)).to eq :north
        expect(subject.grad_to_direction(360)).to eq :north
        expect(subject.grad_to_direction(rand(1..89))).to eq :northeast
        expect(subject.grad_to_direction(90)).to eq :east
        expect(subject.grad_to_direction(rand(91..179))).to eq :southeast
        expect(subject.grad_to_direction(180)).to eq :south
      end
    end
  end
end

require "tdd"

describe "#my_uniq" do
  before(:each) do
    expect_any_instance_of(Array).not_to receive(:uniq)
  end

  context "When called on an array" do
    it "returns an array containing only unique values" do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
    end
  end
end

describe "#two_sum" do 
    let(:array) { [-1, 0, 2, -2, 1] }

    it "returns indices that sum to zero" do 
        expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "returns empty array when no pair is found" do 
        expect([1, 2, 3, 4].two_sum).to be_empty
    end
end

describe "#my_transpose" do
    let(:matrix) { 
        [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ] }

    before(:each) do
      expect_any_instance_of(Array).not_to receive(:transpose)
    end

    it "returns a new matrix where the rows are converted to cols" do
        expect(my_transpose(matrix)).to eq(
          [
              [0, 3, 6],
              [1, 4, 7],
              [2, 5, 8]
          ])
    end
end

describe "#stock_picker" do 
    let(:stocks) { [10, 20, 30, 15, 30, 5] }

    it "returns pair of indices (days) to buy/sell the stock that result in the most profits" do 
        expect(stock_picker(stocks)).to eq([0,4])
    end

    it "the first index must be less than the second index" do
        expect(stock_picker(stocks)[0]).to be < stock_picker(stocks)[1]
    end
end

describe Hanoi do
    subject(:hanoi) { Hanoi.new(3) }
    let(:pile1) { hanoi.piles.first }

    describe "#initialize" do
        it "sets piles to an array of length 3" do
            expect(hanoi.piles.length).to eq(3)
        end

        it "sets the first pile to an array of the input length" do
            expect(pile1.length).to eq(3)
        end

        it "sets the first pile to be an array of numbers in ascending order" do
            expect(pile1).to eq(pile1.sort)
        end
    end

    describe "#move" do
        context "When given an array of two numbers" do
            it "moves the first element from the first pile to the front of the second" do
                disc = hanoi.piles[0][0]
                hanoi.move([0, 1])
                expect(hanoi.piles[1][0]).to eq(disc)
            end
        end

        it "does not change the total number of discs" do
            starting_length = hanoi.piles.flatten.length
            hanoi.move([0, 1])
            hanoi.move([1, 2])
            expect(hanoi.piles.flatten.length).to be(starting_length)
        end
    end

    describe "#won?" do
        context "When the game is won" do
            let(:hanoi_won) { Hanoi.new(3) }
            before(:each) do
                hanoi_won.piles[0] = []
                hanoi_won.piles[1] = []
                hanoi_won.piles[2] = [0, 1, 2]
            end

            it "should have an empty first pile" do
                expect(hanoi_won.piles[0]).to be_empty
            end

            it "should have an empty second pile" do
                expect(hanoi_won.piles[1]).to be_empty
            end

            it "should have a sorted third pile" do
                expect(hanoi_won.piles[2]).to eq(hanoi_won.piles[2].sort)
            end

            it "should return a boolean" do
                expect(hanoi_won.won?).to be(true || false)
            end
        end
    end

    
end

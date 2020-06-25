require 'deck.rb'

describe Deck do 
    subject(:deck) { Deck.new }
    let(:card) {double("card")} 

    describe "initialize" do
        it "should set count to number of cards" do
            expect(deck.cards.length).to eq(52)
        end
    end

    describe "#take" do 
        it "should remove first ele in cards array and return ele" do
            deck.take
            expect(deck.cards.length).to eq(51)
        end
    end

    describe "#shuffle!" do
        it "should shuffle deck" do
            before = deck.cards.dup
            after = deck.shuffle!
            expect(before).not_to eq(after)
        end
    end

    describe "#reset!" do
        it "should reset deck to 52 cards" do
            deck.take
            deck.take
            deck.take
            deck.reset!
            expect(deck.cards.length).to eq(52)
        end
    end
    
end
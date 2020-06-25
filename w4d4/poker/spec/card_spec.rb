require 'card'

describe Card do
    subject(:card1) { Card.new(5, "S") }
    
    describe "initialize" do
        it "should set initial value" do 
            expect(card1.value).to be(5)
        end

        it "should set inital suit" do
            expect(card1.suit).to eq("S")
        end
    end
end

# S♠ 
# H♥
# D♦
# C♣
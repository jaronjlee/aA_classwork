require_relative "card.rb"

class Deck

    attr_reader :cards

    def initialize
        @cards = []
        self.reset!
    end
    
    def reset!
        values = (1..13).to_a
        suits = ["S","C","H","D"]
        @cards = []
        values.each do |value|
            suits.each do |suit|
                @cards << Card.new(value, suit)
            end
        end
        self.shuffle!
    end

    def take
        @cards.shift
    end

    def shuffle!
        @cards.shuffle!
    end

end


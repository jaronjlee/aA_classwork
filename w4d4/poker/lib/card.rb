class Card

    attr_reader :value, :suit

    def initialize(value, suit)
        @value = value
        @suit = suit
    end

    def symbol
        case self.value
        when 11
            "J" + @suit
        when 12
            "Q" + @suit
        when 13
            "K" + @suit
        when 1
            "A" + @suit
        else
            @value
        end
    end
end
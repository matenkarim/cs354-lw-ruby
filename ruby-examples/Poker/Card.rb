# Card class for Poker game
# Represents a single playing card with a value and suit

class Card
    attr_accessor :value
    attr_accessor :suit
    
    # Create a new card from a two-character string (e.g., "As" for Ace of spades)
    def initialize(card)
      cardArr = card.chars() # Convert card string to char array
      @value = cardArr[0]    # First character is the value (2-9, T, J, Q, K, A)
      @suit = cardArr[1]     # Second character is the suit (s, c, h, d)
    end
    
    # Convert card values to numbers for comparison
    def value_to_numeric
      case @value
      when 'T' then 10 # Ten
      when 'J' then 11 # Jack
      when 'Q' then 12 # Queen
      when 'K' then 13 # King
      when 'A' then 14 # Ace (high)
      else @value.to_i # Number cards (2-9)
      end
    end
    
    # Comparison operator to enable sorting based on card value
    def <=>(other)
      value_to_numeric <=> other.value_to_numeric
    end
    
    # String representation of the card
    def to_s
      "#{@value}#{@suit}"
    end
  end
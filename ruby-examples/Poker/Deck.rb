# Deck class for Poker game
# Represents a standard 52-card deck of playing cards

require_relative 'Card'

class Deck
  attr_accessor :cards # List of cards in the deck
  
  # Create a new standard 52-card deck
  def initialize()
    @cards = ['As','2s','3s','4s','5s','6s','7s','8s','9s','Ts','Js','Qs','Ks', # Spades
              'Ac','2c','3c','4c','5c','6c','7c','8c','9c','Tc','Jc','Qc','Kc', # Clubs
              'Ah','2h','3h','4h','5h','6h','7h','8h','9h','Th','Jh','Qh','Kh', # Hearts
              'Ad','2d','3d','4d','5d','6d','7d','8d','9d','Td','Jd','Qd','Kd'] # Diamonds
  end
  
  # Deal a hand of 5 random cards from the deck
  # Cards are removed from the deck when dealt
  # @return [Array<Card>] An array of 5 Card objects
  def deal()
    hand = []
    # Draw 5 random cards from the deck
    5.times do
      randomPlace = rand(@cards.length) # Get random index in deck
      randomCard = @cards[randomPlace]  # Get the card at that index
      card = Card.new(randomCard)       # Create a new Card object
      hand << card                      # Add card to hand
      @cards.delete_at(randomPlace)     # Remove card from deck
    end
    hand # Return the completed hand
  end
  
  # Shuffle the deck randomly
  # @return [Array<String>] The shuffled deck
  def shuffle()
    @cards.shuffle!
  end
end
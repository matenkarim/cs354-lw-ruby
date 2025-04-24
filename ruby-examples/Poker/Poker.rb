require_relative 'Deck'
require_relative 'Hand'
require_relative 'Card'

class PokerGame
  attr_accessor :deck
  attr_accessor :player_hand
  attr_accessor :dealer_hand
  
  def initialize
    @deck = Deck.new
    @deck.shuffle
  end
  
  def deal_hands
    @player_hand = Hand.new(@deck)
    @dealer_hand = Hand.new(@deck)
  end
  
  def display_hands
    puts "\n==== PLAYER'S HAND ===="
    @player_hand.printhand
    
    puts "\n==== DEALER'S HAND ===="
    @dealer_hand.printhand
  end
  
  def determine_winner
    # evaluate the best hand
    player_result = @player_hand.best_hand
    dealer_result = @dealer_hand.best_hand
    
    # evaluate the scores
    player_score = @player_hand.hand_score
    dealer_score = @dealer_hand.hand_score
    
    # compare the scores
    if player_score > dealer_score
      puts "\nPlayer wins with #{player_result}!"
    elsif dealer_score > player_score
      puts "\nDealer wins with #{dealer_result}!"
    else
      puts "\nIt's a true tie! Both have #{player_result}"
    end
  end
  
  def play
    puts "Welcome to Ruby Poker!"
    puts "Shuffling and dealing cards..."
    
    deal_hands
    display_hands
    determine_winner
    
    puts "\nGame over. Thanks for playing!"
  end
end

# Start the game
if __FILE__ == $0
  game = PokerGame.new
  game.play
end
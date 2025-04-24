# Hand class for Poker game
# Represents a hand of 5 cards

require_relative 'Card'

class Hand
  attr_accessor :cards #List of cards in the hand
  
  # Create the object
  def initialize(deck)
    @cards = deck.deal #Takes in a deck object, deals a new hand from that deck
  end
  
  #Returns the best combination the hand contains
  def best_hand ()
    # Check hands in descending order of value
    return "Royal Flush" if royal_flush()
    return "Straight Flush" if straight_flush()
    return "Four of a Kind" if four_of_a_kind()
    return "Full House" if full_house()
    return "Flush" if flush()
    return "Straight" if straight()
    return "Three of a Kind" if three_of_a_kind()
    return "Two Pair" if two_pair()
    return "Pair" if pair()
    return "High Card: #{high_card()}"
  end

  # Calculate a score for the hand to simplify comparison
  # Higher score means better hand
  def hand_score
    base_scores = {
      "Royal Flush" => 9,
      "Straight Flush" => 8,
      "Four of a Kind" => 7,
      "Full House" => 6,
      "Flush" => 5,
      "Straight" => 4,
      "Three of a Kind" => 3,
      "Two Pair" => 2,
      "Pair" => 1,
      "High Card" => 0
    }
  
    # Extract the base hand type (remove any high card info)
    hand_type = best_hand.split(":").first.strip 
    base = base_scores[hand_type] * 10_000_000_000 #Multiply by 10 billion to leave room for card values
  
    #Get the values of the cards and sort them in descending order
    sorted_values = @cards.sort.reverse.map { |card| card.value_to_numeric } #Sort the values in descending order
    tiebreaker = sorted_values.map { |v| "%02d" % v }.join.to_i #Convert to string and join to form a number
  
    base + tiebreaker #Return the combined score
  end
  
  # Check for royal flush
  def royal_flush()
    return false if @cards.nil? || @cards.empty?

    # check if the hand is a flush
    return false unless flush()
    
    # Convert values to numbers and sort them
    values = @cards.sort.map { |card| card.value_to_numeric }
    
    values == [10, 11, 12, 13, 14]
  end
  
  # Check for straight flush
  def straight_flush()
    return false if @cards.nil? || @cards.empty?

    # Check for straight and flush
    straight() && flush()
  end
  
  # Check for four of a kind
  def four_of_a_kind()
    return false if @cards.nil? || @cards.empty?

    valueCounts = Hash.new(0) #Create a hash to store occurences of each value
    @cards.each { |card| valueCounts[card.value] += 1 } #Increment the count for each value

    valueCounts.values.any? { |count| count >= 4} #Returns true if any value was seen 4 or more times, false if not
  end
  
  #Check for full house
  def full_house()
    return false if @cards.nil? || @cards.empty?

    valueCounts = Hash.new(0) #Create a hash to store occurences of each value
    @cards.each { |card| valueCounts[card.value] += 1 } #Increment the count for each value
        
    has_pair = valueCounts.values.include?(2) #Check if there's a pair
    has_three = valueCounts.values.include?(3) #Check if there's a three of a kind

    #Returns true if there's a pair and a three of a kind
    has_pair && has_three
  end
  
  #Check for flush
  def flush()
    return false if @cards.nil? || @cards.empty?

    #Get suit of the first card
    suit = @cards.first.suit
    @cards.all? { |card| card.suit == suit } #Returns true if all cards have the same suit
  end
  
  #Check for straight
  def straight()
    return false if @cards.nil? || @cards.empty?

    # Convert card values to numeric values and sort
    values = @cards.sort.map { |card| card.value_to_numeric }

    # A-5 straight (since ace can be low or high)
    if values == [2, 3, 4, 5, 14]
        return true
    end

    # Check if the values form a consecutive sequence
    # .all? checks if all elements in the range are true
    (0..3).all? { |i| values[i] + 1 == values[i + 1] }
  end
  
  #Check for three of a kind
  def three_of_a_kind()
    return false if @cards.nil? || @cards.empty?

    valueCounts = Hash.new(0) #Create a hash to store occurences of each value
    @cards.each { |card| valueCounts[card.value] += 1 } #Increment the count for each value

    valueCounts.values.any? { |count| count >= 3} #Returns true if any value was seen 3 or more times, false if not
  end
  
  #Check for two pair
  def two_pair()
    return false if @cards.nil? || @cards.empty?

    valueCounts = Hash.new(0) #Create a hash to store occurences of each value
    @cards.each { |card| valueCounts[card.value] += 1 } #Increment the count for each value

    pairs = valueCounts.select { |values, count| count == 2} #Creates an array of all values that appear twice
    pairs.size == 2 #Returns true if the pairs array has 2 elements
  end
  
  #Check for pair
  def pair()
    return false if @cards.nil? || @cards.empty?

    valueCounts = Hash.new(0) #Create a hash to store occurences of each value
    @cards.each { |card| valueCounts[card.value] += 1 } #Increment the count for each value

    valueCounts.values.any? { |count| count >= 2} #Returns true if any value was seen 2 or more times, false if not
  end   
  
  #Get high card
  def high_card()
    return false if @cards.nil? || @cards.empty?

    # Find the highest card in the hand
    # high_card = @cards.max_by { |card| card.value_to_numeric }
    high_card = @cards.max
    # return card as string
    high_card.to_s
  end

  #Print the hand
  def printhand()
    puts "Empty hand" if @cards.nil? || @cards.empty?
    return if @cards.nil? || @cards.empty?

    hand_str = @cards.map { |card| card.to_s }.join(", ")
    puts "Hand: #{hand_str}"
    
    result = best_hand()
    puts "Best hand: #{result}"
  end
end
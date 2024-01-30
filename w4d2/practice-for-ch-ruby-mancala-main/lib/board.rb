require_relative 'player.rb'
class Board
  attr_accessor :cups, :player1, :player2

  def initialize(name1, name2)
    precups = Array.new(14) {Array.new(4, :stone)}
    precups[13] = []
    precups[6] = []
    @cups = precups
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each

  end

  def valid_move?(start_pos)
    if cups[start_pos].nil?
      raise "Invalid starting cup" 
    end
    if cups[start_pos].empty?
      raise "Starting cup is empty" 
    end
  end

  def make_move(start_pos, current_player_name)
    player_hand = []
    until cups[start_pos].empty?
    player_hand << cups[start_pos].shift
    end
    i = start_pos #12 > 13
    until player_hand.empty?
      cup = (i+1) #13
      cup = (cup % 13) - 1 if cup > 13

        if player1.name == current_player_name 
          cups[cup] << player_hand.shift unless cup == 13
        else 
          cups[cup] << player_hand.shift unless cup == 6
        end
      i += 1 
    end

    self.render

    if i > 13
      last_idx = (i % 13) - 1
      self.next_turn(last_idx)
    else
      last_idx = i #i = 13
      self.next_turn(last_idx)
    end

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    else
      case cups[ending_cup_idx].length
      when 1
        :switch
      else
        ending_cup_idx
      end
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if cups[0..5].all? {|cup| cup.empty?} ||
       cups[7..12].all? {|cup| cup.empty?}
    return false
  end

  def winner
    case cups[6].length <=> cups[13].length
    when 1
      player1.name
    when 0
      :draw
    when -1
      player2.name
    end

  end
end
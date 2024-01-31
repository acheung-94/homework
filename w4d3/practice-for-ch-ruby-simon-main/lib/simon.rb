class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    system("clear")
    self.require_sequence
    if !game_over
       self.round_success_message
       @sequence_length += 1
       sleep(1)
       system("clear")
    end

  end

  def show_sequence
    self.add_random_color
    seq.each do |color|
      sleep(1)
      puts color
      sleep(1)
    end
    
  end

  def require_sequence
    i = 0
    until i == @sequence_length
    puts "Repeat each color:"
    input = gets.chomp
    if seq[i] == input
      i += 1
    else
      return @game_over = true
    end
    end
    @game_over = false
  end

  def add_random_color
    color = COLORS.sample
    seq << color
  end

  def round_success_message
    puts "you did it! now do it again!"
  end

  def game_over_message
    puts "Game over! Your score was #{sequence_length-1}."
  end

  def reset_game
    @game_over = false
    @sequence_length = 1
    @seq = []
  end
end

p test = Simon.new
p test.play
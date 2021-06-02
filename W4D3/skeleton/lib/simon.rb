class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game

  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over == true
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color

  end

  def require_sequence

  end

  def add_random_color
    COLORS.each { |color| @seq << color }

  end

  def round_success_message
    puts "Congratulations!"

  end

  def game_over_message
    puts "game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

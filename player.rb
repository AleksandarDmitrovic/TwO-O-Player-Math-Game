class Player
  attr_accessor :name, :lives 

  @@player_count = 0

  def initialize(name = 'Player')
    @@player_count += 1
    @name = "#{name} #{@@player_count}"
    @lives = 3
  end

  def lose
    @lives -= 1
  end

end
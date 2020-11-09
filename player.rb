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

p1 = Player.new
puts p1.name
p2 = Player.new
puts p2.name

puts p1.lives
puts p2.lives

p1.lose

puts p1.lives
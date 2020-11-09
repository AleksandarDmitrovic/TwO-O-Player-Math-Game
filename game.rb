require './player'
require './question'


class Game

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    puts "Welcome #{@player1.name} and #{@player2.name}"
    puts "Let the game begin"
  end

  
  # def question
  #   question = Question.new
  #   @output = question.question
  #   @answer = question.answer
  #   puts

  # end
  
  # def start
  #   question
  # end


end

Game.new
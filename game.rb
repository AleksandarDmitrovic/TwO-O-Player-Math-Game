require './player'
require './question'


class Game

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    puts "Welcome #{@player1.name} and #{@player2.name}"
    puts "Let the game begin"
    @player1_turn = true
  end

  
  def question
    question = Question.new
    @output = question.question
    @answer = question.answer
    if @player1_turn
      puts "#{@player1.name} #{@output}"
    elsif @player1_turn
      puts "#{@player2.name} #{@output}"
    end
  end

  def check_response
    if $stdin.gets.chomp.to_i == @answer
      if @player1_turn
        puts "#{@player1.name}: YES! You are correct."
        puts "P1 #{@player1.lives}/3 vs P2:#{@player2.lives}/3"
        puts "----- NEW TURN -----"
        @player1_turn = false
      else
        puts "#{@player2.name}: YES! You are correct."
        puts "P1 #{@player1.lives}/3 vs P2:#{@player2.lives}/3"
        puts "----- NEW TURN -----"
        @player1_turn = true
      end
    else
      if @player1_turn
        puts "#{@player1.name}: Seriously? No!."
        @player1.lose
        puts "P1 #{@player1.lives}/3 vs P2:#{@player2.lives}/3"
        puts "----- NEW TURN -----"
        @player1_turn = false
      else
        puts "#{@player2.name}: Seriously? No!."
        @player2.lose
        puts "P1 #{@player2.lives}/3 vs P2:#{@player2.lives}/3"
        puts "----- NEW TURN -----"
        @player1_turn = true
      end
    end
  end
  
  def start
    question
    check_response
  end


end

game = Game.new
game.start
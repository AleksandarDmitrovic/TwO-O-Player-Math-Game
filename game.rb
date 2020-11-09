require './player'
require './question'


class Game

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    puts "Welcome #{@player1.name} and #{@player2.name}"
    puts "Let the game begin"
    @player1_turn = false
  end

  
  def question
    question = Question.new
    @output = question.question
    @answer = question.answer
    if @player1_turn
      puts "#{@player1.name} #{@output}"
    else
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
        game_over?
      else
        puts "#{@player2.name}: YES! You are correct."
        puts "P1 #{@player1.lives}/3 vs P2:#{@player2.lives}/3"
        puts "----- NEW TURN -----"
        @player1_turn = true
        game_over?
      end
    else
      if @player1_turn
        puts "#{@player1.name}: Seriously? No!."
        @player1.lose
        puts "P1 #{@player1.lives}/3 vs P2:#{@player2.lives}/3"
        puts "----- NEW TURN -----"
        @player1_turn = false
        game_over?
      else
        puts "#{@player2.name}: Seriously? No!."
        @player2.lose
        puts "P1 #{@player1.lives}/3 vs P2:#{@player2.lives}/3"
        puts "----- NEW TURN -----"
        @player1_turn = true
        game_over?
      end
    end
  end

  def game_over?
    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
      puts "----- GAME OVER -----"
      puts " Good bye!"
    elsif @player2.lives == 0
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
      puts "----- GAME OVER -----"
      puts " Good bye!"
    else
      start
    end
  end
  
  def start
    question
    check_response
  end


end

game = Game.new
game.start
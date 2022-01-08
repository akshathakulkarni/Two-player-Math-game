# @daraakitoye and @akshathakulkarni 
require './players'
require './questions'

class Game 

  def initialize
    @player1 = Player.new('P1')
    @player2 = Player.new('P2')
    @current_player = @player1
  end

  def start
    
    while @player1.lives > 0 && @player2.lives > 0
      question = Question.new
      puts "#{@current_player.name}: #{question.ask_question}"
      player_answer = gets.chomp

      if question.check_answer(player_answer.to_i)
        puts "#{@current_player.name}: That's correct!"
      else
        puts "#{@current_player.name}: Sorry, wrong answer."
        @current_player.lose_life
      end

      lives_remaining()

       if @player1.lives == 0 || @player2.lives == 0
         puts "---END OF GAME---"
        else
          puts "----NEW TURN-----"
        end

      change_player()
    end

  end
  
  def lives_remaining
    puts "#{@player1.name}: #{@player1.lives} LIVES REMAINING, #{@player2.name} : #{@player2.lives} LIVES REMAINING"
  end
  
  def change_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end 
   
end

game = Game.new
game.start


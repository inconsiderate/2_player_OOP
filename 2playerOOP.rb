require './Question'
require './Player'
require 'colorize'

class IncorrectGuessError < StandardError
end

def begin_game
  config_game
  turn_logic
  game_over
  puts "Thanks for playing! (i-made-this)"
end


def config_game
  puts "Welcome to the game!"
  # CREATE PLAYER 1
  print "Player 1 please enter your name: " 
  name1 = gets.chomp!
  @player1 = Player.new(name1)
  puts "hello #{@player1.name}! This will be your color".blue
  # CREATE PLAYER 2
  print "Player 2 please enter your name: " 
  name2 = gets.chomp!
  @player2 = Player.new(name2)
  puts "hello #{@player2.name}! This will be your color.".yellow
end

def turn_logic
  # MAIN GAME LOOP
  @gameRunning = true
  until @gameRunning == false
    player1Question
    if @gameRunning == true
      player2Question
    end
  end
end

def player1Question
  questionTime = Question.new
  puts "Lives Remaining: "
  puts "#{@player1.name} - #{@player1.lives} || #{@player2.name} - #{@player2.lives}"
  print "#{@player1.name} =====> ".blue + questionTime.ask
  answer = gets.chomp
  if answer.to_i == questionTime.answer
    puts "Correct answer!".green
  else
    begin
    raise IncorrectGuessError "You're wrong, idiot!"
    rescue
      puts "You're wrong! ".red + "The correct answer is #{questionTime.answer}"
    end
    @player1.lives -= 1
    if @player1.lives == 0
      @winner = @player2.name
      @player2.score += 1
      @gameRunning = false
    end
  end
end

def player2Question
  questionTime = Question.new
  puts "Lives Remaining: "
  puts "#{@player1.name} - #{@player1.lives} || #{@player2.name} - #{@player2.lives}"
  print "#{@player2.name} =====> ".yellow + questionTime.ask
  answer = gets.chomp
  if answer.to_i == questionTime.answer
    puts "Correct answer!".green
  else
    puts "You're wrong!".red + "The correct answer is #{questionTime.answer}"
    @player2.lives -= 1
    if @player2.lives == 0
      @winner = @player1.name
      @player1.score += 1
      @gameRunning = false
    end
  end
end

def game_over
  begin
  raise PlayerDeadError
  rescue 
  puts "-------------------------------------------------------------"
  puts "-#{@winner} is the winner! Final Score this Game: P1 - #{@player1.lives} || P2 - #{@player2.lives} -".green
  puts "-------------------------------------------------------------"
  puts "#{@player1.name} ".blue + "has won #{@player1.score} games this session!"
  puts "#{@player2.name} ".yellow + "has won #{@player2.score} games this session!"
  end
  print "Do you want to play again? (y/n): "
  input = gets.chomp
  if input == "y"
  @player1.lives = 3
  @player2.lives = 3
  turn_logic
  end
end

begin_game
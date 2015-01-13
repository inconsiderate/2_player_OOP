require 'byebug'
class Question

  def initialize
    @digit1 = rand(6)
    @digit2 = rand(6)
    @operator = operator
  end

  def operator
    var = rand(3)
    # byebug
    if var == 0
      return "+"
    elsif var == 1
      return "-"
    elsif var == 2
      return "*"
    end
  end

  def answer
    @digit1.send @operator,@digit2
  end

  def ask
    "What is #{@digit1} #{@operator} #{@digit2} ? "
  end

end

# # TEST CODE
# q1 = Question.new
# puts q1.ask
# puts q1.answer

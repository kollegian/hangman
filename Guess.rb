require_relative "Question"

class Guess
  attr_accessor :try
  def initialize(a_question)
    @guess=Array.new(a_question.question.length, " * ")
    @try=0
  end
  def guess(a_question)
    x=gets.chomp.downcase
    if x=="save"
      stop(a_question, self)
    end
    if a_question.question.include?(x)
      a_question.question.each_with_index {|a,ind| 
        if a==x
          a_question.display[ind]=" #{x} "
        end  
      }
      a_question.print_question
      display_guess
    else   
      @guess[@try]=" #{x} "
      @try+=1
             
      a_question.print_question
      display_guess
    end
  end
  def display_guess
    @guess.each do |a|
      print a
    end
    puts  
  end
  def is_on?(a_question)
    return true if @try<@guess.length && a_question.display.any?{|a| a==" _ "}
  end
      
end  
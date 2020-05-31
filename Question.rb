class Question
  attr_accessor :question, :display  
  @@word_list = File.open("5desk.txt", "r").readlines.select {|a| a.chomp.length<12 && a.chomp.length>5}
  def initialize
    @question=@@word_list.sample.chomp.downcase
    @question=@question.split("")
    @display=Array.new(@question.length, " _ ")
  end
  def print_question
    
    @display.each do |a|
      print a
    end
    puts 
  end
  
end  


  

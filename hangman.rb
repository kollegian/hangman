require_relative "Guess"
require_relative "Question"
require "yaml"

def stop(quest_obj, gues_obj)
  File.open("question.yml", "w"){|file| file.write(quest_obj.to_yaml)}
  File.open("guessing.yml", "w"){|file| file.write(gues_obj.to_yaml)}
end
def resume
  a=YAML.load(File.read("question.yml"))
  b=YAML.load(File.read("guessing.yml"))
  play(a,b)
end
def play(quest_obj, gues_obj)
  while gues_obj.is_on?(quest_obj)
  quest_obj.print_question
  gues_obj.display_guess
  gues_obj.guess(quest_obj)
  if gues_obj.try==3
    stop(quest_obj, gues_obj)
  end
 end
end

game1=Question.new
play1=Guess.new(game1)

play(game1, play1)



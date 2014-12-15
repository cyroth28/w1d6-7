class Hangman
  attr_accessor :checker, :guesser
  def initialize(checker, guesser)
    @checker, @guesser = checker, guesser
  end

  def play
    @guesser.guess
  end


end

class Computer
  attr_reader :secret_word
  def initialize
    @secret_word = pick_secret_word
  end

  def pick_secret_word
    secret_word = File.readlines('dictionary.txt').sample.chomp
  end

  def guess
    letters_used = []
    letters = ('a'..'z').to_a
    guess = nil
    until guess
      guess = letters.sample
      guess = nil if letters_used.include?(guess)
    end
    guess
  end
end

class Human
  attr_reader :secret_word
  def initialize
    @secret_word = pick_secret_word
  end

  def pick_secret_word
    puts "Pick a real word."
    secret_word = nil
    until secret_word
      secret_word = gets
      unless File.readlines('dictionary.txt').include?(secret_word)
        secret_word = nil
        puts "Idiot. Pick a REAL word."
      end
    end
    secret_word
  end

  def guess
    letters_used = []
    letters = ('a'..'z').to_a
    guess = nil
    puts "Guess a letter."
    until guess
      guess = gets.chomp
      guess = nil if letters_used.include?(guess)
    end
    guess
  end

end
c = Computer.new
h = Human.new
a = Hangman.new(h, h)
p a.play

require ('pry')

class Word
  attr_reader :id
  attr_accessor :name
  @@words = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id)
      Word.sort
  end

  def == (word_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def self.search(name)
    @@words.values.select do |word|
      word.name == name
    end
  end

  def self.sort
    array = @@words.sort_by {|key, val| val.name}
    @@words = Hash[array.map { |key, val | [key,val]}]
  end

  def update(name)
    self.name = name
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def delete
    @@words.delete(self.id)
  end

  def definitions
    Definition.find_by_word(self.id)
  end

end

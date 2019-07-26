require ('pry')

class Word
  attr_reader :id
  attr_accessor :name

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def == (word_to_compare)
    self.name() == word_to_compare.name()
  end

  def create
    @@words[self.id] = self
    Word.sort
  end

  def delete
    @@words.delete(self.id)
  end

  def update(name)
    self.name = name
    @@words[self.id] = self
  end

  def definitions
    Definition.find_by_word(self.id)
  end

  def self.search(name)
    @@words.values.select do |word|
      word.name == name
    end
  end
end

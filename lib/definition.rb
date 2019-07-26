require ('pry')

class Definition
  attr_reader :id
  attr_accessor :define, :word_id
  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @define = attributes.fetch(:define)
    @word_id = attributes.fetch(:word_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@words.values
  end

  def ==(definition_to_compare)
    (self.define() == definition_to_compare.define()) && (self.word_id() == definition_to_compare.word_id())
  end

  def self.clear
    @@definitions = {}
  end

  def self.find(id)
    @@defintions[id]
  end

  def create
    @@definitions[self.id] = self
  end

  def update(define, word_id)
    self.define = define
    self.word_id = word_id
    @@definitions[self.id] = self
  end

  def delete
    @@definitions.delete(self.id)
  end

  def word
    Word.find(self.word_id)
  end

  def self.find_by_word(wrd_id)
    definitions = {}
    @@definitions.values.each do |definition|
      if definition.word_id == word_id
        definitions.push(definition)
      end
    end
    definitions
  end


end

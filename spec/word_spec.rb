require 'rspec'
require 'word'

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  #
  describe('#save') do
    it("saves a word") do
      word = Word.new( "Cow",  nil)
      word.save()
      word2 = Word.new( "Elephant",  nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#==') do
    it("if it has the same name of each word") do
      word = Word.new( "Elephant",  nil)
      word2 = Word.new( "Elephant",  nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new( "Elephant",  nil)
      word.save()
      word2 = Word.new( "Cow",  nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end
  #
  describe('.find') do
    it("finds an word by id") do
      word = Word.new( "Elephant",  nil)
      word.save()
      word2 = Word.new( "Cow",  nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end
  #
  describe('#update') do
    it("updates an word by id") do
      word = Word.new( "Elephant",  nil)
      word.save()
      word.update("Cow" )
      expect(word.name).to(eq("Cow"))
    end
  end

  describe('#delete') do
    it("deletes an word by id") do
      word = Word.new( "Cow", nil)
      word.save()
      word2 = Word.new( "Elephant",  nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end
end

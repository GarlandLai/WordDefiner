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


  describe('#create') do
    it("creates a word") do
      word = Word.new({:name => "Elephant", :id => nil})
      word.create()
      word2 = Word.new({:name => "Cow", :id => nil})
      word2.create()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#==') do
    it("if it has the same name of each word") do
      word = Word.new({:name => "Elephant", :id => nil})
      word2 = Word.new({:name => "Elephant", :id => nil})
      expect(word).to(eq(word2))
    end
  end

  describe('.clear') do
      it("clears all words") do
        word = Word.new({:name => "Elephant", :id => nil})
        word.create()
        word2 = Word.new({:name => "Cow", :id => nil})
        word2.create()
        Word.clear()
        expect(Word.all).to(eq([]))
      end
    end
    #
      describe('.find') do
        it("finds an word by id") do
          word = Word.new({:name => "Elephant", :id => nil})
          word.create()
          word2 = Word.new({:name => "Cow", :id => nil})
          word2.create()
          expect(Word.find(word.id)).to(eq(word))
        end
      end
    #
      describe('#update') do
        it("updates an word by id") do
          word = Word.new({:name => "Elephant", :id => nil})
          word.create()
          word.update("Cow" )
          expect(word.name).to(eq("Cow"))
        end
      end


      describe('#delete') do
        it("deletes an word by id") do
          word = Word.new({:name => "Cow",:id => nil})
          word.create()
          word2 = Word.new({:name => "Elephant", :id => nil})
          word2.create()
          word.delete()
          expect(Word.all).to(eq([word2]))
        end
      end
end

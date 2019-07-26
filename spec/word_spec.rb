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

  # describe('#==') do # This check whether the duplicated word assignment for same artist or not.
  #   it("is the same word if it has the same attributes as another word") do
  #     word = Word.new({:name => "Garland Word", :message => "Do work", :id => nil})
  #     word2 = Word.new({:name => "Garland Word", :message => "Do work", :id => nil})
  #     expect(word).to(eq(word2))
  #   end
  # end
  #
  # describe('.clear') do
  #     it("clears all words") do
  #       word = Word.new({:name => "Garland Word", :message => "Do work", :id => nil})
  #       word2 = Word.new({:name => "Tae Word", :message => "Do work", :id => nil})
  #       word2.create()
  #       Word.clear()
  #       expect(Word.all).to(eq([]))
  #     end
  #   end
  #
  #   describe('.find') do
  #     it("finds an word by id") do
  #       word = Word.new({:name => "Garland Word", :message => "Do work", :id => nil})
  #       word.create()
  #       word2 = Word.new({:name => "Tae Word", :message => "Do work", :id => nil})
  #       word2.create()
  #       expect(Word.find(word.id)).to(eq(word))
  #     end
  #   end
  #
  #   describe('#update') do
  #     it("updates an word by id") do
  #       word = Word.new({:name => "Garland Word", :message => "Do work", :id => nil})
  #       word.create()
  #       word.update("Tae Word", "Do work" )
  #       expect(word.name).to(eq("Tae Word"))
  #     end
  #   end
  #
  #   describe('#create') do
  #     it("creates a word") do
  #       word = Word.new({:name => "Garland Word", :message => "Do work", :id => nil})
  #       word.create()
  #       word2 = Word.new({:name => "Tae Word", :message => "Sleep", :id => nil})
  #       word2.create()
  #       expect(Word.all).to(eq([word, word2]))
  #     end
  #   end
  #
  #   describe('#delete') do
  #     it("deletes an word by id") do
  #       word = Word.new({:name => "Garland Word", :message => "Do work", :id => nil})
  #       word.create()
  #       word2 = Word.new({:name => "Tae Word", :message => "Sleep", :id => nil})
  #       word2.create()
  #       word.delete()
  #       expect(Word.all).to(eq([word2]))
  #     end
  #   end

end

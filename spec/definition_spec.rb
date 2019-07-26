require 'rspec'
require 'definition'
require 'word'

describe "#Definition" do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new({:name => "Cow", :id => nil})
    @word.create()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new({:define => "An animal", :word_id => @word.id, :id => nil})
      definition2 = Definition.new({:define => "An animal", :word_id => @word.id, :id => nil})
      expect(definition).to(eq(definition2))
    end
  end


  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new({:define => "An animal", :word_id => @word.id, :id => nil})
      definition.create()
      definition2 = Definition.new({:define => "Food", :word_id => @word.id, :id => nil})
      definition2.create()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end
  #
  describe('#create') do
    it("creates an definition") do
      definition = Definition.new({:define => "I go moooo", :word_id => @word.id, :id => nil})
      definition.create()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds an definition by id") do
      definition = Definition.new({:define => "An Animal", :word_id => @word.id, :id => nil})
      definition.create()
      definition2 = Definition.new({:define => "Food", :word_id => @word.id, :id => nil})
      definition2.create()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates an definition by id") do
      definition = Definition.new({:define => "An Animal", :word_id => @word.id, :id => nil})
      definition.create()
      definition.update("Food", @word.id)
      expect(definition.define).to(eq("Food"))
    end
  end

  describe('#delete') do
    it("deletes an definition by id") do
      definition = Definition.new({:define => "An Animal", :word_id => @word.id, :id => nil})
      definition.create()
      definition2 = Definition.new({:define => "Food", :word_id => @word.id, :id => nil})
      definition2.create()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end
end

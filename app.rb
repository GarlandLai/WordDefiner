require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
require('./lib/definition')
also_reload('lib/**/*.rb')

get ('/') do
  @words = Word.all
  erb(:words)
end

get ('/words') do
  @words = Word.all
  erb(:words)
end

get ('/words/new') do
  erb(:new_word)
end

post ('/words') do
  name = params[:word_name]
  word = Word.new(name, nil)
  word.save()
  @words = Word.all()
  erb(:words)
end

get ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end


# post ('/words_search') do
#   name = params[:search]
#   @word = Word.search(name)
#   erb(:word_results)
# end

get ('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  @words = Word.all
  erb(:words)
end

delete ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end


post ('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:definition_name], @word.id, nil)
  definition.save()
  erb(:word)
end

get ('/words/:id/definitions/:word_id') do
  @definition = Definition.find(params[:id].to_i())
  erb(:definition)
end
# Edit a definition and then route back to the word view.
patch ('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:name], @word.id)
  erb(:word)
end


# Delete a definition and then route back to the word view.
delete ('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

# get ('/words/:id/definitions/:definition_id/lyrics') do
#   @definition = Definition.find(params[:definition_id].to_i())
#   erb(:lyrics)
# end
#
# post ('/words/:id/definitions/:definition_id/lyrics') do
#   lyrics = params[:lyrics]
#   definition = Definition.new(name, lyrics)
#   definition.save()
#   @definition = Definition.new()
#   erb(:words)
# end

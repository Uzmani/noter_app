get '/' do
  @notes = Note.all
  erb :index
end

post '/create' do 
  @nots = Note.all
  puts "[LOG] Posting /create"
  puts "[LOG] Params: #{params.inspect}"
  Note.create(title: params[:title_input], content: params[:content_input])
  #erb :index
  redirect '/'
end

# get '/:id' do
#   @note = Note.params[:id]  
#   @title = "Edit note ##{params[:id]}"  
#   erb :edit_note 
# end  

put '/update' do 
  puts params
  puts "[LOG] Posting /update"
  puts "[LOG] Params: #{params.inspect}"

  note = Note.find(params[:id])
  note.update(title: params[:title_input], content: params[:content_input])

  redirect '/'
end



get '/:id' do
  puts params
  puts "[LOG] Posting /update"
  puts "[LOG] Params: #{params.inspect}"

  @note = params[:id]
  # @edit_title = "Update Note ##{params[:id]}"
  erb :edit_note
end
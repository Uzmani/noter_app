get '/' do
  @notes = Note.all
  erb :index
end

post '/notes' do 
  @nots = Note.all
  puts "[LOG] Posting /create"
  puts "[LOG] Params: #{params.inspect}"
  Note.create(title: params[:title_input], content: params[:content_input])
  #erb :index
  redirect '/'
end


put '/notes/:id' do 
  puts params
  puts "[LOG] Posting /update"
  puts "[LOG] Params: #{params.inspect}"

  note = Note.find(params[:id])
  note.update(title: params[:title_input], content: params[:content_input])

  redirect '/'
end

get '/notes/:id/edit' do
  puts params
  puts "[LOG] Posting /update"
  puts "[LOG] Params: #{params.inspect}"

  @note = Note.find(params[:id])
  erb :edit_note
end

get '/notes/:id/delete' do  
  @note = Note.find(params[:id])   
  erb :delete  
end 

delete '/:id' do 
  note = Note.find(params[:id])
  note.destroy

  redirect '/'
end

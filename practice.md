class Practice < ApplicationController


 #---------------------- create
  get '/cats' do
    erb :cats_index
  end
 "select * from cats"

  get 'cats/new' do
    erb :new
  end

  post '/cats' do
    @cats = Cat.all
    erb :new_cats
    redirect '/cats/:id'
  end
"Insert into cats (name, id) VALUS etc.........."
  # ------------------------ read

  get 'cats/:id' do
    @cat = Cat.find(params[:id])
    erb :cat_show
  end

  "select * from cats where id = cat_id"

  # --------------------------- update

  get 'cats/:id/edit' do
    @cat = Cat.find(params[:id])
    erb :edit
  end

  patch 'cats/:id' do
    @cat.update(params[:cat_info])
    redirect 'cats/#{cat.id}'
  end

"update cats ____________ where cat_id = id"
  # ------------------------ Delete

  delete '/cats/:id' do
    @cat = Cat.find(params[:id])
    @cat.delete
  end

  "delete from tabe where cat ID == id"


end

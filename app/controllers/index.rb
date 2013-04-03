require_relative "../models/category"

get '/' do
  @all_cats = Category.show_all
  erb :index
end

get '/categories/:cat_id' do
  # raise params[:cat_id].inspect
  @all_posts = Category.get_posts(params[:cat_id])
  
  erb :posts
end

get '/posts/new' do
  erb :create_post
end

get '/posts/editkey/:id' do
  # raise Post.find(params[:id]).inspect
  @id = params[:id]
  @key = Post.find(@id).secure_key
  erb :show_edit_key
end


get '/posts/:post_id/edit/:key' do
  @post = Post.show_info(params[:post_id])
  erb :edit_post if params[:key] == @post.secure_key
end

get '/posts/:post_id' do
  @post = Post.show_info(params[:post_id])
  erb :post_details
end

post '/create_post' do
  cat = Category.find(params[:category_id])
  new_post = cat.posts.create(params[:post])
  redirect to "/posts/editkey/#{new_post.id}"
end

post '/update_post/:id' do
  Post.update(params[:id], params[:post])
  # key = params[:post][:secure_key]
  # edit_post = cat.posts.update(params[:post])
  redirect to "/posts/editkey/#{params[:id]}"
end


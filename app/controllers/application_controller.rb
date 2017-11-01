require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #read
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  #create
  get '/posts/new' do
    erb :new
  end

  #create
  post '/posts' do
    Post.create(params)
    erb :posts
  end

  #read
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  #update
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  #update
  patch '/posts/:id' do
    @post = Post.update(params[:id], :name => params[:name], :content => params[:content])
    erb :show
  end

  #delete
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    Post.delete(params[:id])
    erb :delete
  end

end

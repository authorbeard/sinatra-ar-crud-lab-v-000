require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    redirect '/posts'
  end

  get '/posts/new' do
    
    erb :new
  end

  post '/posts' do
    @post=Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
  end

  get '/posts' do
    @all=Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    erb :show
  end

  delete '/posts/:id/delete' do

    @post = Post.find(params[:id])
    @post.destroy
    redirect '/posts'
  end

end
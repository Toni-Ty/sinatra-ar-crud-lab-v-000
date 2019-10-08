
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #
  # end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
      @articles = Article.create(params)
      redirect '/posts'
    erb :show
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #renderd update form
  get '/articles/:id/edit' do
    erb :edit
  end

  patch '/articles/:id'  do
    id = params["id"]
    new_params = {}
    old_post = Post.find(id)
    new_params[:name] = params["name"]
    new_params[:content] = params["content"]
    old_post.update(new_params)

    redirect "/posts/#{id}"
    end

    delete '/articles/:id/delete' do
      @article = Post.find(params[:id])
      @article.delete
      erb :delete
    end
  end


require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
      @articles = Article.create(params)
      redirects to '/articles'
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
    @articles = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id'  do
    @articles = Post.find_by_id(params[:id])
    @articles.name = params[:name]
    @articles.content = params[:content]
    @articles.save
    erb :show
  end


    delete '/articles/:id/delete' do
      @articles = Article.find(params[:id])
      @articles.delete
      erb :delete
    end
  end

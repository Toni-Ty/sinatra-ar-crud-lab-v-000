
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
      @article = Article.create(params)
      redirect '/articles/3'
    erb :show
  end

  get '/articles' do
    @article = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #renderd update form
  get '/posts/:id/edit' do
  @article = Article.find_by_id(params[:id])
  erb :edit
end
  end

  patch '/articles/:id'  do
    @article = Article.find_by_id(params[:id])
    @article.name = params[:name]
    @article.content = params[:content]
    @article.save
    erb :show
  end


    delete '/articles/:id/delete' do
      @article = Article.find(params[:id])
      @article.delete
      erb :delete
    end
  end

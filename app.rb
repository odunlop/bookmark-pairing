require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader 
  end

  get '/' do 
    "Bookmark Manager"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do 
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.create(params['url'])
    redirect '/bookmarks'
  end
end

require 'sinatra/base'
require 'sinatra/reloader'

class BookmarkManager < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader 
  end
end

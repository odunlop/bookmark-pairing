require 'bookmark'

describe Bookmark do 
  describe '.all' do
    it "lists all of the user's bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all
      
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end

  describe '.create' do 
    it 'creates a new bookmark entry' do 
      Bookmark.create(url: 'http://www.twitch.tv')
      
      expect(Bookmark.all).to include 'http://www.twitch.tv'
    end
  end
end

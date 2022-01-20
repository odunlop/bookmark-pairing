require 'bookmark'
require 'database_helpers'

describe Bookmark do 
  describe '.all' do
    it "lists all of the user's bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all
      
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do 
    it 'creates a new bookmark entry' do 
      bookmark = Bookmark.create(url: 'http://www.twitch.tv', title: 'Twitch')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id'] # The persisted data object is a hash of the SQL query return thus why we're calling ['id']
      expect(bookmark.title).to eq 'Twitch'
      expect(bookmark.url).to eq 'http://www.twitch.tv'
    end
  end

  describe '.delete' do 
    it 'deletes an existing bookmark' do 
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end
end

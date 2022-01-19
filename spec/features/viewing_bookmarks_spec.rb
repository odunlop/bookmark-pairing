require 'pg'

feature 'Viewing bookmarks' do 
  scenario 'A user can see their bookmarks' do 

    # Add the test data
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.create(url: "http://www.twitch.tv", title: "Twitch")

    visit('/bookmarks')

    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Twitch', href: 'http://www.twitch.tv')
  end
end

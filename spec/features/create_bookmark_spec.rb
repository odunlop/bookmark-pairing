require 'pg'

feature 'Creating bookmarks' do 
  scenario 'User creates new bookmark' do 
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks/new')
    fill_in "url", with: 'http://twitch.tv'
    fill_in "title", with: "Twitch"
    click_button "Save"

    expect(page).to have_link('Twitch', href: 'http://twitch.tv')
  end
end

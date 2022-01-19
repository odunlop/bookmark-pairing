require 'pg'

feature 'Creating bookmarks' do 
  scenario 'User creates new bookmark' do 
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks/new')
    fill_in "url", with: 'http://twitch.tv'
    click_button "Save"

    expect(page).to have_content 'http://twitch.tv'
  end
end

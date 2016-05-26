require 'rails_helper'

describe 'Movie Management' do
  feature 'User creates a movie' do
    scenario 'with a valid title' do
      visit root_path
      click_link 'Add Movie'
      fill_in 'Title', with: 'Top Gun'
      click_button 'Create Movie'
      expect(page).to have_content('Movie created successfully')
    end
  end
end

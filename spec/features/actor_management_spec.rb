require 'rails_helper'

describe 'Actor Management' do
  feature 'User creates an actor' do
    scenario 'with a valid name' do
      visit root_path
      click_link 'Add Actor'
      fill_in 'Name', with: 'Tom Cruise'
      click_button 'Create Actor'
      expect(page).to have_content('Actor created successfully')
    end
  end
end

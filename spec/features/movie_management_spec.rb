require 'rails_helper'

feature 'Movie management' do
  background do
    actor = create(:actor, name: 'Gene Wilder')
    movie = create(:movie, title: 'Blazing Saddles', actor_ids: [actor.id])
  end

  scenario 'Viewing the movie list' do
    visit '/'
    click_link 'Movies'
    expect(page).to have_link('Blazing Saddles')
    expect(page).to have_link('Gene Wilder')
  end

  scenario 'Creating a movie with valid input' do
    visit root_path
    click_link 'Add Movie'
    fill_in 'Title', with: 'Top Gun'
    click_button 'Create Movie'
    expect(page).to have_content('Movie created successfully')
  end
end

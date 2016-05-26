require 'rails_helper'

feature 'Actor management' do
  background do
    movie = create(:movie, title: 'Top Gun')
    actor = create(:actor, name: 'Tom Cruise', movie_ids: [movie.id])
  end

  scenario 'Viewing the actor list' do
    visit '/'
    click_link 'Actors'
    expect(page).to have_link('Tom Cruise')
    expect(page).to have_link('Top Gun')
  end

  scenario 'Creating an actor with a valid name' do
    visit root_path
    click_link 'Add Actor'
    fill_in 'Name', with: 'Tom Cruise'
    click_button 'Create Actor'
    expect(page).to have_content('Actor created successfully')
  end
end

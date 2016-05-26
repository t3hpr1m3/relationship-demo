require 'rails_helper'

feature 'Movie management' do
  let!(:actor) { create(:actor, name: 'Gene Wilder') }
  let!(:movie) { actor.movies.create(title: 'Blazing Saddles') }

  scenario 'Viewing the movie list' do
    visit '/'
    click_link 'Movies'
    expect(page).to have_link(movie.title)
    expect(page).to have_link(actor.name)
  end

  scenario 'Creating a movie with valid input' do
    visit root_path
    click_link 'Add Movie'
    fill_in 'Title', with: 'Top Gun'
    click_button 'Create'
    expect(page).to have_content('Movie created successfully')
  end

  scenario 'Creating a duplicate movie' do
    visit root_path
    click_link 'Add Movie'
    fill_in 'Title', with: movie.title
    click_button 'Create'
    expect(page).to have_content('Movie already exists.')
  end

  scenario 'Removing an actor from a movie' do
    visit '/'
    click_link 'Movies'
    click_link movie.title
    click_link 'Edit'
    uncheck actor.name
    click_button 'Save'
    within(:xpath, "//tr[@data-movie='#{movie.title}']") do
      expect(page).not_to have_text actor.name
    end
  end

  scenario 'Deleting a movie' do
    visit '/'
    click_link 'Movies'
    click_link movie.title
    click_link 'Delete'
    expect(page).not_to have_text(movie.title)
    expect(page).to have_text('Movie successfully deleted.')
  end
end

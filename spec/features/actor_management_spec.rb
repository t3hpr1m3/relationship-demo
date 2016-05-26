require 'rails_helper'

feature 'Actor management' do
  let!(:movie) { create(:movie, title: 'Top Gun') }
  let!(:actor) { movie.actors.create(name: 'Top Cruise') }

  scenario 'Viewing the actor list' do
    visit '/'
    click_link 'Actors'
    expect(page).to have_link(actor.name)
    expect(page).to have_link(movie.title)
  end

  scenario 'Creating an actor with a valid name' do
    visit root_path
    click_link 'Add Actor'
    fill_in 'Name', with: 'Gene Wilder'
    click_button 'Create'
    expect(page).to have_content('Actor created successfully.')
  end

  scenario 'Creating a duplicate actor' do
    visit root_path
    click_link 'Add Actor'
    fill_in 'Name', with: actor.name
    click_button 'Create'
    expect(page).to have_content('Actor already exists.')
  end

  scenario 'Removing a movie from an actor' do
    visit '/'
    click_link 'Actors'
    click_link actor.name
    click_link 'Edit'
    uncheck movie.title
    click_button 'Save'
    within(:xpath, "//tr[@data-actor='#{actor.name}']") do
      expect(page).not_to have_text movie.title
    end
  end

  scenario 'Deleting an actor' do
    visit '/'
    click_link 'Actors'
    click_link actor.name
    click_link 'Delete'
    expect(page).not_to have_text(actor.name)
    expect(page).to have_text('Actor successfully deleted.')
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Home page:' do
  before do
    @paul = User.create!(first_name: 'Paul', last_name: 'Smith', email: 'paul@example.com', password: 'password')
  end

  scenario 'when a non-member visits the home page' do
    visit '/'

    expect(page).to_not have_content('Workout Lounge')
    expect(page).to have_content('Join the Athletes Den')
    expect(page).to have_link('Home')
    expect(page).to have_link('Athletes Den')
    expect(page).to have_link('Sign up')
  end

  scenario 'when a member visits the home page' do
    login_as(@paul)

    visit '/'

    expect(page).to have_content('Workout Lounge')
    expect(page).to_not have_content('Join the Athletes Den')
    expect(page).to have_link('Home')
    expect(page).to have_link('Athletes Den')
    expect(page).to_not have_link('Sign up')
  end

end

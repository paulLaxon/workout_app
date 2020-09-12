# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Home page:' do
  scenario 'when a user visits the home page' do
    visit '/'

    expect(page).to have_content('Workout Lounge')
    expect(page).to have_content('Show off your workout')
    expect(page).to have_link('Home')
    expect(page).to have_link('Athletes Den')
  end
end

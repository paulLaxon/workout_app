# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Searching for members:' do
  before do
    @paul = User.create!(first_name: 'Paul', last_name: 'Laxon', email: 'paul@example.com', password: 'password')
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password')
    @sarah = User.create!(first_name: 'Sarah', last_name: 'Laxon', email: 'sarah@example.com', password: 'password')
  end

  scenario 'with existing name returns all those users' do
    visit '/'

    fill_in 'search_name', with: 'Laxon'

    click_button 'Search'

    expect(page).to have_content(@paul.full_name)
    expect(page).to have_content(@sarah.full_name)
    expect(page).to_not have_content(@john.full_name)
    expect(current_path).to eq('/dashboards/search')
  end
end

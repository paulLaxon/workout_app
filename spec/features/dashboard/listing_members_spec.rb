# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Listing members:' do
  before do
    @paul = User.create!(first_name: 'Paul', last_name: 'Smith', email: 'paul@example.com', password: 'password')
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password')
    @sarah = User.create!(first_name: 'Sarah', last_name: 'Laxon', email: 'sarah@example.com', password: 'password')

    login_as(@paul)
  end

  scenario 'show a list of registered members' do
    visit '/'

    expect(page).to have_content('Member List')
    expect(page).not_to have_content(@paul.full_name)
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
  end
end

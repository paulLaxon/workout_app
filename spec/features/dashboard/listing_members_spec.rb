# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Listing membes:' do
  before do
    @paul = User.create!(first_name: 'Paul', last_name: 'Laxon', email: 'paul@example.com', password: 'password',)
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password')
    @sarah = User.create!(first_name: 'Sarah', last_name: 'Laxon', email: 'sarah@example.com', password: 'password')
  end

  scenario 'show a list of registered members' do
    visit '/'

    expect(page).to have_content('Member List')
    expect(page).to have_content(@paul.full_name)
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
  end
end

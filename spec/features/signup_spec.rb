# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign up user:' do
  scenario 'when a user signs up' do
    visit '/'

    click_link 'Sign up'
    fill_in 'Email', with: 'paul@example.com'
    fill_in 'Password', with: 'password'

    expect(page).to have_content('You have signed up successfully')
  end
end

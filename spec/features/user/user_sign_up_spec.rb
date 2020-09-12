# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign up user:' do
  scenario 'when a user signs up with valid credentials' do
    visit '/'

    click_link 'Sign up'

    fill_in 'Email', with: 'paul@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully')
    expect(page).to have_link('Sign out')
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign out user:' do
  before do
    @user = User.create!(email: 'test@test.com', password: 'password')
    visit '/'

    click_link 'Sign in'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
  end

  scenario 'when a user signs out' do
    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully')
    expect(page).to have_no_content(@user.email)
    expect(page).to have_no_content('Sign out')
    expect(page).to have_content('Sign in')
  end
end

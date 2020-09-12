# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign in user:' do
  before do
    @user = User.create!(email: 'test@test.com', password: 'password')
  end

  scenario 'when a user signs in with valid credentials' do
    visit '/'

    click_link 'Sign in'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content(@user.email)
  end
end

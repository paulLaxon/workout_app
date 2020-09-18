# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign out user:' do
  before do
    @user = User.create!(email: 'test@test.com', password: 'password')
    login_as(@user)
  end

  scenario 'when a user signs out' do
    visit '/'
    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully')
    expect(page).to have_no_link('Sign out')
    expect(page).to have_link('Sign in')
  end
end

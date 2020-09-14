# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Editing exercise:' do
  before do
    @user = User.create!(email: 'user@example.com', password: 'password')
    @e1 = @user.exercises.create(duration_in_min: 20, workout: 'Body building', workout_date: Date.today)

    login_as(@user)
  end

  scenario 'editing existing exercise succeeds' do
    visit '/'

    click_link 'My Lounge'

    path = "/users/#{@user.id}/exercises/#{@e1.id}/edit"
    link = "a[href=\'#{path}\']"
    find(link).click

    fill_in 'Duration', with: 45
    click_button 'Update Exercise'

    expect(page).to have_content(45)
    expect(page).not_to have_content(20)
    expect(page).to have_content('Exercise has been updated')
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Deleting exercise:' do
  before do
    @user = User.create!(first_name: 'Paul', last_name: 'Laxon', email: 'user@example.com', password: 'password')
    @e1 = @user.exercises.create(duration_in_min: 43, workout: 'Body building', workout_date: Date.today)

    login_as(@user)
  end

  scenario ' succeeds' do
    visit '/'

    click_link 'My Lounge'

    path = "/users/#{@user.id}/exercises/#{@e1.id}"
    link = "//a[contains(@href,\'#{path}\') and .//text()='Delete']"

    find(:xpath, link).click

    expect(page).to have_content('Exercise has been deleted')
  end
end

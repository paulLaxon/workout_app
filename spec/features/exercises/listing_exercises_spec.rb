# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Listing workouts:' do
  before do
    @user = User.create!(email: 'user@example.com', password: 'password')
    login_as(@user)

    @e1 = @user.exercises.create(duration_in_min: 20, workout: 'Body building', workout_date: Date.today)
    @e2 = @user.exercises.create(duration_in_min: 55, workout: 'Cardio', workout_date: 2.days.ago)
    @e3 = @user.exercises.create(duration_in_min: 23, workout: 'Weight lifting', workout_date: 8.days.ago)
  end

  scenario 'show user workouts for the last 7 days' do
    visit '/'

    click_link 'My Lounge'

    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
    expect(page).to_not have_content(@e3.duration_in_min)
    expect(page).to_not have_content(@e3.workout)
    expect(page).to_not have_content(@e3.workout_date)
  end

  scenario 'if there are no user workouts' do
    @user.exercises.delete_all

    visit '/'

    click_link 'My Lounge'

    expect(page).to have_content('No workouts yet')
  end
end

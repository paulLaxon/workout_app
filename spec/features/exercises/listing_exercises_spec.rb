# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Listing workouts:' do
  before do
    @paul = User.create!(first_name: 'Paul', last_name: 'Laxon', email: 'paul@example.com', password: 'password')
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password')
    login_as(@john)

    @e1 = @john.exercises.create(duration_in_min: 20, workout: 'Body building', workout_date: Date.today)
    @e2 = @john.exercises.create(duration_in_min: 55, workout: 'Cardio', workout_date: 2.days.ago)
    # @e3 = @john.exercises.create(duration_in_min: 23, workout: 'Weight lifting', workout_date: 8.days.ago)

    @following = Friendship.create(user: @john, friend: @paul)
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

    # expect(page).to_not have_content(@e3.duration_in_min)
    # expect(page).to_not have_content(@e3.workout)
    # expect(page).to_not have_content(@e3.workout_date)
  end

  scenario 'if there are no user workouts' do
    @john.exercises.delete_all

    visit '/'

    click_link 'My Lounge'

    expect(page).to have_content('No workouts yet')
  end

  scenario 'shows a list of user\'s friends' do
    visit '/'

    click_link 'My Lounge'

    expect(page).to have_content('My Friends')
    expect(page).to have_link(@paul.full_name)
    expect(page).to have_link('Unfollow')
  end
end

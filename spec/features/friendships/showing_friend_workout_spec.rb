# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Listing workouts:' do
  before do
    @paul = User.create!(first_name: 'Paul', last_name: 'Laxon', email: 'paul@example.com', password: 'password')
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password')
    login_as(@john)

    @e1 = @john.exercises.create(duration_in_min: 20, workout: 'Body building', workout_date: Date.today)
    @e2 = @paul.exercises.create(duration_in_min: 55, workout: 'Cardio', workout_date: 2.days.ago)
    # @e3 = @john.exercises.create(duration_in_min: 23, workout: 'Weight lifting', workout_date: 8.days.ago)

    @following = Friendship.create(user: @john, friend: @paul)
  end

  scenario 'shows friend\'s workout' do
    @john.exercises.delete_all

    visit '/'

    click_link 'My Lounge'
    click_link @paul.full_name

    expect(page).to have_content(@e2.workout)
    expect(page).to have_content("#{@paul.full_name}'s Workouts")
    expect(page).to have_css('div#chart')
  end
end

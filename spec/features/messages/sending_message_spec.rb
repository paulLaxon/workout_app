# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sending a message:' do
  before do
    @paul = User.create!(first_name: 'Paul', last_name: 'Smith', email: 'paul@example.com', password: 'password')
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password')
    @sarah = User.create!(first_name: 'Sarah', last_name: 'Smith', email: 'sarah@example.com', password: 'password')

    @room_name = @john.first_name + '-' + @john.last_name
    @room = Room.create!(name: @room_name, user_id: @john.id)

    login_as(@john)

    Friendship.create(user: @sarah, friend: @john)
    Friendship.create(user: @paul, friend: @john)
  end

  scenario 'shows two followers in chatroom window' do
    visit '/'

    click_link 'My Lounge'
    expect(page).to have_content(@room_name)

    message = 'Hello.'
    fill_in 'message-field', with: message
    click_button 'Post'
    expect(page).to have_content(message)

    within('#followers') do
      expect(page).to have_link(@sarah.full_name)
      expect(page).to have_link(@paul.full_name)
    end
  end
end

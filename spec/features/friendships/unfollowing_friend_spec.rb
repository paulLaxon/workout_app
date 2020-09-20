# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Unfollowing members:' do
  before do
    @paul = User.create!(first_name: 'Paul', last_name: 'Laxon', email: 'paul@example.com', password: 'password')
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password')

    login_as(@john)

    @following = Friendship.create(user: @john, friend: @paul)
  end

  scenario 'unfollow friend' do
    visit '/'

    click_link 'My Lounge'

    link = "a[href='/friendships/#{@following.id}'][data-method='delete']" # data-method allows us to distinguish between 2 links on page
    find(link).click

    expect(page).to have_content("#{@paul.full_name} unfollowed")
  end
end

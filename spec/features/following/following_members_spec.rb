# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Following members:' do
  before do
    @paul = User.create!(first_name: 'Paul', last_name: 'Laxon', email: 'paul@example.com', password: 'password')
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password')
    @sarah = User.create!(first_name: 'Sarah', last_name: 'Laxon', email: 'sarah@example.com', password: 'password')

    login_as(@john)
  end

  scenario 'if signed in' do
    visit '/'

    expect(page).to have_content(@paul.full_name)
    expect(page).to have_content(@john.full_name)
    # expect(page).to have_content(@sarah.full_name)

    href = "/friends?friend_id=#{@john.id}"
    expect(page).not_to have_link('Follow', href: href)

    link = "a[href='/friends?friend_id=#{@paul.id}']"
    find(link).click

    href = "/friends?friend_id=#{@paul.id}"
    expect(page).not_to have_link('Follow', href: href)
  end
end

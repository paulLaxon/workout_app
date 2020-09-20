class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User' # friend is alias for user
end

class Followers < ActiveRecord::Base
  has_one :user
  has_many :feeds
end

# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  provider         :string(255)
#  uid              :string(255)
#  name             :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#  created_at       :datetime
#  updated_at       :datetime
#  feed_id          :integer
#

class User < ActiveRecord::Base
  before_create :gen_uniq_username
  #after_save :make_new_feed

  has_one :feed

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.now + 1.hour
      user.feed = Feed.new
      user.save!
    end
  end

  def slug_username
    self.name.downcase.gsub(" ", "-")
  end

  private
  def gen_uniq_username
    potential = slug_username
    tries =0
    while not User.find_by_username(potential).nil? || tries > 5
      potential = "#{slug_username}-#{Random.rand(500000)}"
      tries += 1
    end
    self.username=potential
  end

end

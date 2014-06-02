# == Schema Information
#
# Table name: feeds
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  style       :string(255)
#  uri         :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#

class Feed < ActiveRecord::Base
  
  belongs_to  :user
  has_many :observations

end

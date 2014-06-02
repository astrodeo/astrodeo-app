# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  path           :string(255)
#  description    :text
#  width          :integer
#  height         :integer
#  created_at     :datetime
#  updated_at     :datetime
#  observation_id :integer
#

class Photo < ActiveRecord::Base
  mount_uploader :path, PhotoUploader
  belongs_to  :observation
  default_scope order('created_at DESC')

end

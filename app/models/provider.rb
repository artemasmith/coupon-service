# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  uri        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  key        :text
#

class Provider < ActiveRecord::Base
  has_many :coupons
  has_many :categories
end

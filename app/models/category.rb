# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  cid         :string(255)
#  provider_id :integer
#

class Category < ActiveRecord::Base
  has_many :coupons
  belongs_to :provider
end

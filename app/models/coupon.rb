# == Schema Information
#
# Table name: coupons
#
#  id          :integer          not null, primary key
#  url         :text
#  description :text
#  name        :string(255)
#  category_id :integer
#  price       :float
#  currency    :string(255)
#  out_id      :string(255)
#  provider_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  img         :text
#  available   :boolean
#

class Coupon < ActiveRecord::Base
  belongs_to :provider
  belongs_to :category

  validates :url, presence: true
  validates :name, presence: true
end

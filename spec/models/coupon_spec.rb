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

require 'spec_helper'

describe Coupon do
  context 'can not create inconcistent coupon' do
    let(:wc1) { Coupon.new(name: 'test', description: 'test') }
    let(:wc2) { Coupon.new(price: 10.0, description: 'test') }
    it { expect{ wc1.save }.not_to change{ Coupon.count} }
    it { expect{ wc2.save }.not_to change{ Coupon.count} }
  end
  context 'create respective coupon' do
    let(:rc){ Coupon.new(name: 'respective', price: 10.0, url: 'http://localhost/1') }
    it 'create coupon' do
      expect { rc.save }.to change{ Coupon.count }.by(1)
      Coupon.last.should eq(rc)
    end
  end
end

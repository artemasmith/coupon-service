class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @coupon = Coupon.find(params[:id])
  end
end

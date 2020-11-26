class Api::V1::CouponsController < Api::V1::BaseController
before_action :set_coupon, only: [:show, :destroy]
skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def index
    @coupons = Coupon.all
    # render json: @coupons
  end

  def show
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      render json: { coupon: @coupon, status: :success }
    else
      render_error
    end
  end

  def my_coupons
    @coupons = Coupon.where(user_id: params[:id])
    render json: { coupons: @coupons, status: :success }
  end

  def destroy
    @coupon.destroy
    head :no_content
    render json: { status: :success }
  end

  private

  def set_coupon
    @coupon = Coupon.find(params[:id])
  end

  def render_error
    render json: { error: @coupon.errors.full_messages }
  end

  def coupon_params
    params.require(:coupon).permit(:user_id, :name, :validity, :offer, :shop_name, :address, :shop_info, :contacts)
  end
end

class Api::V1::ClaimsController < ApplicationController
  def create
    @claim = Claim.new(claim_params)
    if @claim.save
      render json: { claim: @claim, status: :success }
    else
      render_error
    end
  end

  def index
    @claims = Claim.all
  end

  def destroy
    @claim.destroy
    head :no_content
  end

  private

  def claim_params
    params.require(:claim).permit(:user_id, :coupon_id)
  end

  def render_error
    render json: { error: @coupon.errors.full_messages }
  end
end

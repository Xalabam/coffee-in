class Api::V1::ClaimsController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def create
    @claim = Claim.new(claim_params)
    if @claim.save
      render json: { claim: @claim, status: :success }
    else
      render_error
    end
  end

  def my_claims
    @claims = Claim.where(user_id: params[:id])
    render json: { claims: @claims, status: :success }
  end

  def destroy
    @claim = Claim.find(params[:id])
    @claim.destroy
    head :no_content
  end

  private

  def claim_params
    params.require(:claim).permit(:user_id, :coupon_id)
  end

  def render_error
    render json: { error: @claim.errors.full_messages }
  end
end

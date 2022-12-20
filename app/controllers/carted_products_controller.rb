class CartedProductsController < ApplicationController
  def create
    cart = CartedProduct.new(
    user_id: current_user.id,
    product_id: params[:product_id],
    order_id: params[:order_id],
    status: params[:status]
    )
    render json: cart.as_json
  end
end

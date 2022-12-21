class CartedProductsController < ApplicationController
  def create
    carted_product = CartedProduct.new(
    user_id: current_user.id,
    product_id: params[:product_id],
    order_id: nil,
    status: "carted",
    quantity: params[:product_id]
    )
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: {errors: carted_product.errors.full_messages}
    end
  end

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    # @carted_products = current_user.carted_products.where(status: "carted")
    render template: "carted_products/index"
  end

  def destroy
    cp = CartedProduct.find_by(id: params[:id])
    cp.status = "removed"
    cp.save
    render json: {message: "Removed from cart"}
  end

end

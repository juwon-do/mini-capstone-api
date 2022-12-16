class OrdersController < ApplicationController
  before_action :authenticate_user
  
  def create
    @product = Product.find_by(id: params[:product_id])
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:product_id],
      subtotal: @product.price * params[:product_id].to_f,
      tax: @product.tax * params[:product_id].to_f,
      total: @product.total * params[:product_id].to_f
    )
    order.save
    render json: order.as_json
  end

  def show
    order = Order.find_by(id: current_user.id)
    if current_user.id == order.id
      render json: order.as_json
    else
      render json: [], status: :unauthorized
    end
  end

  def index
    order = Order.where(id: current_user.id)
    render json: order.as_json
  end
end

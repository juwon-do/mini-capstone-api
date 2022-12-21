class OrdersController < ApplicationController
  before_action :authenticate_user
  
  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    subtotal = 0
    carted_products.each do |carted|
      # @product = Product.find_by(id: carted.product_id)
      subtotal = subtotal + carted.product.price * carted.quantity
    end
    tax = subtotal * 0.09
    total = subtotal + tax
    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    order.save
    carted_products.each do |cp|
      cp.order_id = order.id,
      cp.status = "purchased"
      cp.save
    end

    render json: order.as_json
  end

  def show
    @order = Order.find_by(id: current_user.id)
    if current_user.id == @order.id
      render template: "orders/show"
    else
      render json: [], status: :unauthorized
    end
  end

  def index
    @orders = Order.where(id: current_user.id)
    render template: "orders/index"
  end
end

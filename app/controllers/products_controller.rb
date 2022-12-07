class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end
  def show
    product = Product.find_by(id: params[:id])
    render json: product.as_json
  end
  def create
    product = Product.new(
      id: params[:input_id],
      name: params[:input_name],
      price:params[:input_price],
      image_url: params[:input_image_url],
      description: params[:input_description]
    )
    product.save
    render json: product.as_json
  end
  def update
    product = Product.find_by(id: params[:id])
    product.id = params[:id]
    product.name = params[:name]
    product.price = params[:price]
    product.image_url = params[:image_url]
    product.description = params[:description]
    product.save
    render json: product.as_json
  end
  def delete
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: product.as_json
  end
end

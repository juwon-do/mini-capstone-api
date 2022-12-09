class ProductsController < ApplicationController
  def index
    @products = Product.all
    # render json: products.as_json
    render template: "products/index"
  end
  def show
    @product = Product.find_by(id: params[:id])
    # render json: product.as_json(methods: [:friendly_created_at, :is_discounted?])
    render template: "products/show"
  end
  def create
    product = Product.new(
      name: params[:name],
      price:params[:price],
      image_url: params[:image_url],
      description: params[:description]
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

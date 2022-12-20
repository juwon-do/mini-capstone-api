class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]
 
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
    @product = Product.new(
      name: params[:name],
      price:params[:price],
      # image_url: params[:image_url],
      description: params[:description],
      inventory: params[:inventory],
      supplier_id: params[:supplier_id]
    )
    
    if @product.save
      params[:images].each do |image|
        image = Image.new(
          url: image,
          product_id: @product.id
        )
        image.save
      end
      render template: "products/show"
    else
      render json: {errors: product.errors.full_messages}
    end
  end
  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name]
    product.price = params[:price]
    # product.image_url = params[:image_url]
    product.description = params[:description]
    product.inventory = params[:inventory]
    product.save
    render json: product.as_json
  end
  def delete
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: product.as_json
  end
end

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
      id: "101",
      name: "car",
      price: "30000",
      image_url: "https://tesla-cdn.thron.com/delivery/public/image/tesla/8c26f779-11e5-4cfc-bd7c-dcd03b18ff88/bvlatuR/std/4096x2561/Model-X-Main-Hero-Desktop-LHD",
      description: "Electric SUV Car"
    )
    product.save
    render json: product.as_json
  end
end

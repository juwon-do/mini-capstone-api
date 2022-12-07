class ProductsController < ApplicationController
  def all
    product = Product.all
    render json: product.as_json
  end
  def show
    
    p "params"
    p params["id"]
    p "params"
    products = Product.find_by(id: params["id"])
    render json: products.as_json
  end
end

class ProductsController < ApplicationController
  def all
    product = Product.all
    render json: product.as_json
  end
end

class ProductsController < ApplicationController
  def show
    render json: {message: "hello in controller"}
  end
end

class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products

  def products
    products = product.category_products
    products.each do |prod|
      return prod
    end
  end
end

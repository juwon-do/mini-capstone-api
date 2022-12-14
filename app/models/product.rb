class Product < ApplicationRecord
  # validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :price, presence: true
  # validates :price, numericality: { greater_than: 0 }
  # validates :description, presence: true
  # validates :description, length: { in: 10..500 }
  
  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end
  def tax
    price * 0.09
  end
  def total
    price + tax
  end
  def is_discounted?
    price < 10
  end
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  belongs_to :supplier

  has_many :images
end

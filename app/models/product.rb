class Product < ApplicationRecord
  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end
  def is_discounted?
    if price.to_i < 10
      p "true"
    else
      p "false"
    end
  end
end

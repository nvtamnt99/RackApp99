class Product < ActiveRecord::Base
  validates :product_name, length: { is: 4 }
  validates :category_id, presence: true
  validates :product_id, presence: true
  validates :discontinued, presence: true
  validates_with CategoryValidator
end

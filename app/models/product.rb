class Product < ApplicationRecord
  validates :name, presence: true
  validates :sku, presence: true, uniqueness: true
  validates :cost_price, numericality: { greater_than_or_equal_to: 0 }
  validates :retail_price, numericality: { greater_than_or_equal_to: 0 }
  validates :supplier, presence: true
  validates :inventory, numericality: { greater_than_or_equal_to: 0 }
end

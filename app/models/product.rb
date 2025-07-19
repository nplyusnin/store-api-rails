class Product < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: {
                      case_sensitive: false
                    }

  validates :slug, presence: true,
                   uniqueness: {
                     case_sensitive: false
                   }

  validates :price, presence: true,
                    numericality: { greater_than: 0 }
end

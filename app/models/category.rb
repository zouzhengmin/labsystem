class Category < ApplicationRecord

  has_many :samples, dependent: :destroy
  has_ancestry
end

class Result < ApplicationRecord
  belongs_to :item
  belongs_to :sample
  has_many :result_values


end

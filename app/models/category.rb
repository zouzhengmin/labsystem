class Category < ApplicationRecord

  before_validation :correct_ancestry
  validates :title, presence: {message: "名称不能为空"}

  has_many :samples, dependent: :destroy
  has_ancestry

  private
  def correct_ancestry
    self.ancestry = nil if self.ancestry.blank?
  end
end

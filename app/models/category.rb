class Category < ApplicationRecord

  before_validation :correct_ancestry

  validates :title, presence: {message: "分类名称不能为空"}
  validates :title, uniqueness: {message: "分类名称不能重复"}

  has_many :samples, dependent: :destroy
  has_ancestry orphan_strategy: :destroy

  private
  def correct_ancestry
    self.ancestry = nil if self.ancestry.blank?
  end
end

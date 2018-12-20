class Sample < ApplicationRecord

  validates :category_id, presence: { message: "样品分类不能为空" }
  validates :name, presence: { message: "样品分类不能为空" }
  validates :code, presence: { message: "样品编码不能为空" }

  has_many :templates, dependent: :destroy
  has_many :items, :through => :templates
  belongs_to :category

end

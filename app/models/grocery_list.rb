class GroceryList < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: "GroceryItem", dependent: :destroy

  validates :title, presence: true, uniqueness: { case_sensitive: false }
end

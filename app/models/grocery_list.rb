class GroceryList < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  normalizes :title, with: ->(title) { title.downcase }

  validates :title, presence: true, uniqueness: { case_sensitive: false, scope: :user_id }
end

class Item < ApplicationRecord
  belongs_to :grocery_list

  normalizes :name, with: ->(name) { name.downcase }

  validates :name, :quantity, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :grocery_list }
  validates :quantity, numericality: { greater_than: 0 }

  scope :unchecked, -> { where(checked_at: nil) }
  scope :checked, -> { where.not(checked_at: nil) }
  scope :sorted_by_checked_at_and_name, -> { order(Arel.sql("CASE WHEN checked_at IS NULL THEN 0 ELSE 1 END, name ASC")) }

end

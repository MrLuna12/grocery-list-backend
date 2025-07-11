class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity, :checked_at, :created_at, :updated_at
  belongs_to :grocery_list
end

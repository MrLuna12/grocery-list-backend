class GroceryItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def grocery_item_params
    params.require(:grocery_item).permit(:name, :quantity, :grocery_list_id)
  end
end

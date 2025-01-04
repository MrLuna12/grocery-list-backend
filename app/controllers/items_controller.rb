class ItemsController < ApplicationController
  before_action :set_grocery_list

  def index
  end

  def show
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

  def item_params
    params.require(:item).permit(:name, :quantity, :grocery_list_id)
  end

  private

  def set_grocery_list
    @grocery_list = current_user.grocery_lists.find(params[:grocery_list_id])
  end
end

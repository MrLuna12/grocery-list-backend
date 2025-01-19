class ItemsController < ApplicationController
  before_action :set_grocery_list
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @grocery_list.items.items
  end

  def show
  end

  def new
    @item = @grocery_list.items.new
  end

  def create
    @item = @grocery_list.items.new(item_params)

    if @item.save
      redirect_to @grocery_list, notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @grocery_list, notice: "Item was successfully updated."
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :grocery_list_id, :checked_at)
  end

  private

  def set_grocery_list
    @grocery_list = current_user.grocery_lists.find(params[:grocery_list_id])
  end

  def set_item
    @item = @grocery_list.items.find(params[:id])
  end
end

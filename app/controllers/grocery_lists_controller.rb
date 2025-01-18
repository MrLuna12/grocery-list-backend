class GroceryListsController < ApplicationController
  before_action :set_grocery_list, only: [ :show, :edit, :update, :destroy ]

  def index
    @grocery_lists = current_user.grocery_lists
  end

  def show
    @items = @grocery_list.items.sorted_by_checked_at_and_name
  end

  def new
    @grocery_list = current_user.grocery_lists.new
  end

  def create
    @grocery_list = current_user.grocery_lists.new(grocery_list_params)

    if @grocery_list.save
      redirect_to @grocery_list, notice: "Grocery list was successfully created."

    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_grocery_list
    @grocery_list = current_user.grocery_lists.find(params[:id])
  end

  def grocery_list_params
    params.require(:grocery_list).permit(:title)
  end
end

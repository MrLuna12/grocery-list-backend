class GroceryListsController < ApplicationController
  before_action :set_grocery_list, only: [ :show, :edit, :update, :destroy ]

  def index
    @grocery_lists = current_user.grocery_lists
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

  private

  def set_grocery_list
    @grocery_list = current_user.grocery_lists.find(params[:id])
  end
end

module Api
  module V1
    class ItemsController < ApplicationController
      before_action :set_grocery_list
      before_action :set_item, only: [ :show, :update, :destroy ]

      def index
        @items = @grocery_list.items
        render json: @items
      end

      def show
        render json: @item
      end

      def create
        @item = @grocery_list.items.build(item_params)

        if @item.save
          render json: @item, status: :created
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      def update
        if @item.update(item_params)
          render json: @item
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @item.destroy
        head :no_content
      end

      private

      def set_grocery_list
        @grocery_list = current_user.grocery_lists.find(params[:grocery_list_id])
      end

      def set_item
        @item = @grocery_list.items.find(params[:id])
      end

      def item_params
        params.require(:item).permit(:name, :quantity, :completed)
      end
    end
  end
end

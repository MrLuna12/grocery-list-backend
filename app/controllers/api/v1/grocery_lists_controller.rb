module Api
  module V1
    class GroceryListsController < BaseController
      before_action :set_grocery_list, only: [ :show, :update, :destroy ]

      def index
        @grocery_lists = current_user.grocery_lists
        render json: @grocery_lists
      end

      def show
        render json: @grocery_list
      end

      def create
        @grocery_list = current_user.grocery_lists.build(grocery_list_params)

        if @grocery_list.save
          render json: @grocery_list, status: :created
        else
          render json: @grocery_list.errors, status: :unprocessable_entity
        end
      end

      def update
        if @grocery_list.update(grocery_list_params)
          render json: @grocery_list
        else
          render json: @grocery_list.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @grocery_list.destroy
        head :no_content
      end

      private

      def set_grocery_list
        @grocery_list = current_user.grocery_lists.find(params[:id])
      end

      def grocery_list_params
        params.require(:grocery_list).permit(:name)
      end
    end
  end
end

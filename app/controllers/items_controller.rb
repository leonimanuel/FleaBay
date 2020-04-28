class ItemsController < ApplicationController
	def new
		@item = Item.new(user: User.find(params[:user_id]))
	end

	def create
		item = Item.create(item_params)
		redirect_to user_items_path(User.find(params[:item][:user_id]))
	end

	def index
		if params[:user_id]
			@user = User.find(params[:user_id])
			@items = @user.items
		else
			@items = Item.all
		end
	end

	def show
		@item = Item.find(params[:id])
	end



	private

	def item_params
		params.require(:item).permit(:name, :condition, :start_price, :user_id)
	end
end

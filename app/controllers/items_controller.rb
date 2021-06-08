class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :item_edit, only:[:edit]
  before_action :item_update, only:[:update]

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.valid?
        @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  def edit
    unless item_edit
      redirect_to root_path
    end
  end

  def update
    unless item_update
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  # def destroy
  #   if user_signed_in? && current_user.id == @item.user_id
  #     @item.destroy
  #     redirect_to root_path
  #   end
  # end

  private

  def item_edit
    @item_edit = user_signed_in? && current_user.id == @item.user_id
  end

  def item_update
    @item_update = user_signed_in? && current_user.id ==  @item.update(item_params)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
  params.require(:item).permit(:title, :text, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end

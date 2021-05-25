class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]



  def show
  end

  def new
    @item = Item.new
  end


  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end

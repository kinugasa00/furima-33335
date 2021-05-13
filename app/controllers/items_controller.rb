class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :require_login]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    
  end

  def show
  end

  def new
    @item = Item.new
  end


end

class ItemsController < ApplicationController
  before_action :move_to_index, only: :new

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
    @item = @item.include(:user)
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
      redirect_to root_path
    else
      @item = @item.include(:user)
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :status_id, :payment_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end

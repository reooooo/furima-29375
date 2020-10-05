class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new, :edit]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
    # @item = @item.include(:user)
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item.id)
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

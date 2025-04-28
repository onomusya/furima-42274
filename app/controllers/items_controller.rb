class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :title, :content, :category_id, :condition_id,
      :shipping_fee_burden_id, :prefecture_id, :shipping_day_id,
      :price, :image
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    return if user_signed_in? && current_user.id == @item.user_id

    redirect_to root_path
  end
end

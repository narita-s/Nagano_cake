class Public::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(8)
    @total_items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item =CartItem
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price)
  end

end

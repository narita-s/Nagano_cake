class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new  
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to items_path
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image_id, :introduction, :price, :is_active)
  end
  
end

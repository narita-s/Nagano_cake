class Admin::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to '/admin/items'
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item= Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
      flash[:notice] = "You have created successfully."
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end

end

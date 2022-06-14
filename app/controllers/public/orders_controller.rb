class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def create
    @order = Order.new(order_params)
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items

    if params[:order][:address_select] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:address_select] == "1"
      @order.postal_code =  Address.find(params[:order][:address_id]).postal_code
      @order.address = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).name
  　elsif params[:order][:address_select] = "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render 'new'
    end

  end

  def thanks
  end

  def index
  end

  def show
    # @order = current_customer.orders.find(params[:id])
    # @order_items = @order.order_items
    # @total = @order_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  private

    def order_params
        params.require(:order).permit(:postal_code, :address, :name, :total_prive, :shipping_cost, :payment_method, :status)
    end

end

class OrdersController < ApplicationController

before_action :authenticate_api, :only => [:create, :index, :show]

#expects from client a customer id and list of product ids and qty's
  def index
    render json: @store.orders
  end

  def show
    @product = @store.orders.find params[:id]
    render json: @product
  end

  def create
    @order = Order.new
    customer = Customer.find params[:customer_id]
    @order.customer = customer
    params[:products].each do |p|
      product = Product.find p[:product_id]
      order_item = OrderItem.create(product_id: product.id, price: product.price, quantity: p[:qty])
      @order.order_items << order_item
    end
    @order.save
  end

  private

  def authenticate_api
    authenticate_or_request_with_http_token do |token, options|
      @store = Store.where(api_key: token).first
    end
  end
end

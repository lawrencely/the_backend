class OrdersController < ApplicationController
respond_to :json
before_action :authenticate_api, :only => [:create, :index, :show]

#expects from client a customer id and list of product ids and qty's
  def index
    render json: @store.orders
  end

############### show ajax request for orders

# $.ajax({
#    method: 'get',
#    beforeSend: function(request)
#    {
#     request.setRequestHeader("Authorization"," Token token=7OGWgGjg5kNEoKyl33aHaQtt")
#    },
#    url: '/orders/21',
#       success:function(data) {
#          console.log(data);
#       }
#  });

###################

  def show
    @product = @store.orders.find params[:id]
    render json: @product
  end

  ####################
# tested ajax request

# $.ajax({
#   method: 'POST',
#   beforeSend: function(request)
#   {
#     request.setRequestHeader("Authorization"," Token token=NPHurTV9GxentCa5Z11Z7wtt")
#   },
#   url: 'http://pacific-spire-8238.herokuapp.com/orders',
#   data: {
#   customer_id: 7,
#   products:
#     [
#       { product_id: 5,
#         price: '21',
#         quantity: '2' },
#       { product_id: 6,
#         price: '200',
#         quantity: '1'}
#     ]
#   },
#   success:function(data) {
#   console.log(data);
#   }
# });

  ####################

  # returns

# {id: 39, customer_id: 7, status: null, memo: null, store_id: null…}
# country: null
# created_at: "2014-11-26T02:14:52.602Z"
# customer_id: 7
# id: 39
# ip_address: null
# memo: null
# postcode: null
# state: null
# status: null
# store_id: null
# street: null
# suburb: null
# updated_at: "2014-11-26T02:14:52.602Z"
# working :)
  ##########

  def create
    customer = Customer.find params[:customer_id]
    @order = customer.orders.create
    @order.customer = customer
    @order.store = @store
    params[:products].each do |p|
      product = Product.find p[1][:product_id].to_i
      order_item = OrderItem.create(product_id: product.id, price: product.price, quantity: p[1][:quantity] )
      @order.order_items << order_item
    end
    @order.save
    render json: @order.order_items
  end



  private

  def authenticate_api
    authenticate_or_request_with_http_token do |token, options|
      @store = Store.where(api_key: token).first
    end
  end
end

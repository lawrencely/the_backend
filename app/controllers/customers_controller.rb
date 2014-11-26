class CustomersController < ApplicationController

  before_action :authenticate_api, :only => [:create, :update, :show]


  def index
    @customers = @store.customers
  end

################ show single customer ajax request
# $.ajax({
#    method: 'get',
#    beforeSend: function(request)
#    {
#     request.setRequestHeader("Authorization"," Token token=7OGWgGjg5kNEoKyl33aHaQtt")
#    },
#    url: '/customers/7',
#       success:function(data) {
#          console.log(data);
#       }
#  });
################

  def show
    @customer = @store.customers.find params[:id]
    render json: @customer
  end

  def create
    @customer = Customer.new
    @customer.name = params[:name]
    @customer.email = params[:email]
    @customer.password = params[:password]
    if @customer.save
      render json: @customer
    else
      render json: { error: @customer.errors }
    end
  end

  def update
    @customer = @store.customers.find params[:id]
    @customer.name = params[:name]
    @customer.email = params[:email]
    @customer.password = params[:password]
    if @customer.save
      render json: @customer
    else
      render json: { error: @customer.errors }
    end
  end

  private

  def authenticate_api
    authenticate_or_request_with_http_token do |token, options|
      @store = Store.where(api_key: token).first
    end
  end
end

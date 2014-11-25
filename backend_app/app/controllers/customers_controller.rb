class CustomersController < ApplicationController

  before_action :authenticate_api, :only => [:create, :update]

  def index
    @customers = @store.customers
  end

  def show
    @customer = @store.customers.find params[:id]
  end

  def create

  end

  def update
  end

  private

  def authenticate_api
    authenticate_or_request_with_http_token do |token, options|
      @store = Store.where(api_key: token).first
    end
  end
end

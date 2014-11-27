class StoresController < ApplicationController
    respond_to :js

  def index
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new store_params
    @store.user_id = @current_user.id
    if @store.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @store = Store.find params[:id]
    @customers = @store.customers.order('created_at DESC').limit 5
    @categories = @store.categories.order('created_at DESC').limit 5
    @orders = @store.orders.order('created_at DESC').limit 5
    @allorders = @store.orders
    @products = @store.products.order('created_at DESC').limit 5
    @customers_all = @store.customers
    @products_all = @store.products
  end

  def edit
    @store = Store.find params[:id]
  end

  def update
    @store = Store.find params[:id]
    if @current_user.id == @store.user_id && @store.update(store_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    store = Store.find params[:id]
    store.destroy
    redirect_to root_path
  end

  private

  def store_params
    params.require(:store).permit(:name, :description, :user_id, :api_key, :api_secret)
  end

end

class ProductsController < ApplicationController
#class Api::V1::ProductController < ApplicationController

  before_action :authenticate_api, :only => [:index, :show]

  def index
    render json: @store.products
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    @store = @current_user.stores.first
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    @store = @current_user.stores.first
    if @product.store_id == @store.id && @product.update(product_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = @store.products.find_by id: params[:id]
    render json: @product
  end

  def destroy
    product = Product.find params[:id]
    product.destroy
    redirect_to product_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :short_description, :price, :product_attributes, :image, :store_id, :category_ids)
  end

  def authenticate_api
    authenticate_or_request_with_http_token do |token, options|
      @store = Store.where(api_key: token).first
    end
  end
end

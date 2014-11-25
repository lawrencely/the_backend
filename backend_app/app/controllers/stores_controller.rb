class StoresController < ApplicationController

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

  # def authenticate_api
  #   authenticate_or_request_with_http_token do |token, options|
  #     @store = Store.where(api_key: token).first
  #   end
  # end

end

class StoresController < ApplicationController

  def new
    @store = Store.new
  end

  def create
    @store = Store.new store_params
    @store.user_id = @current_user.id
    @store.save
    redirect_to root_path
  end

  def edit
    @store = Store.find params[:id]
  end

  def update
    store = Store.find params[:id]
    if @current_user.id == store.user_id
        store.update store_params
        redirect_to root_path
    else
      render :new
    end
  end

  def delete
  end

  def store_params
    params.require(:store).permit(:name, :description, :user_id)
  end

end

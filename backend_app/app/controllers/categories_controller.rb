class CategoriesController < ApplicationController
  # def index
  #   if @current_user.present?
  #     @category = Category.where :store_id => @current_user.id
  #   else
  #     redirect_to root_path
  #   end
  # end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    @store = @current_user.stores.first
    @category.store_id = @store.id
    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    @store = @current_user.stores.first
    if @category.store_id == @store.id && @category.update(category_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    category = Category.find params[:id]
    category.destroy
    redirect_to root_path
  end

  # def show
  #   @category = Category.find params[:id]
  # end

  private

  def category_params
    params.require(:category).permit(:name, :description, :store_id)
  end
end

class PagesController < ApplicationController
  def home
    if @current_user.present?
      #@store = @current_user.stores
      redirect_to stores_path(@current_user.stores.first)
    end
  end
end

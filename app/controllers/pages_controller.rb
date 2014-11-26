class PagesController < ApplicationController
  def home
    if @current_user.present?
      redirect_to stores_path(@current_user.stores.first)
    end
  end
end

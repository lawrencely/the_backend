class StoresController < ApplicationController

  def new
    @store = Store.new
  end

  def create

    ############################### does this go here or in the application helper
    before_create do |doc|
      doc.api_key = doc.generate_api_key
    end
    ###############################

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
    params.require(:store).permit(:name, :description, :user_id, :api_key, :api_secret, :api_rpm)
  end

  def authenticate_api
    authenticate_or_request_with_http_token do |token, options|
      @store = Store.where(api_key: token).first
    end
  end

  # NOTE: For ref
  # Manual way of authenticate request
  def authenticate_manual
    api_key = request.headers['X-Api-Key']
    @store = Store.where(api_key: api_key).first if api_key

    unless @store
      head status: :unauthorized
      return false
    end
  end

  # Check request per min
  # You can add field to user table request per min or define constant.
  # Here I am just passsing some random value
  def validate_rpm
    if ApiRpmStore.threshold?(@store.id, @store.api_rpm) # 10 request per min
      render json: { help: 'http://mysite.com/plans' }, status: :too_many_requests
      return false
    end
  end
end

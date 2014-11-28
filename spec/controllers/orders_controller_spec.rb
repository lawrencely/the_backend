require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
  before do
    @current_user = User.create!(
      name: 'test',
      email: 'test@test.com',
      password: 'testtest',
      password_confirmation: 'testtest'
    )
    @store = Store.create!(
      name: 'test_store',
      description: 'test_store_desciption',
      api_key: '',
      api_secret: '',
      user_id: @current_user.id
    )
    @customer = Customer.create!(
      name: 'test',
      email: 'test@test.com',
      password: 'testtest',
      store_id: @store.id
    )
    @category = Category.create!(
      name: 'test_category',
      description: 'test_description',
      store_id: @store.id
    )
    @order = Order.create!(
      customer_id: @customer.id,
      store_id: @store.id
      )
    @product = Product.create!(
        name: 'test_product',
        description: 'test_description',
        short_description: 'test_short_description',
        price: 'test_price',
        product_attributes: 'test_product_attributes',
        store_id: @store.id,
        image: 'test_image'
      )
    request.env['HTTP_AUTHORIZATION'] = "Token token=#{@store.api_key}"
    get :index, nil , {'Authorization' => "Token token=#{@store.api_key}" }
  end
    it 'should render all products' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.count).to eq(1)
    end
    describe 'SHOW' do
      before do
        @order = Order.create!(
          customer_id: @customer.id,
          store_id: @store.id
        )

      request.env['HTTP_AUTHORIZATION'] = "Token token=#{@store.api_key}"
      get :show, { id: @order.id }, { 'Authorization' => "Token token=#{@store.api_key}" }
      end
      it 'should render json for the correct customer' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['id']).to eql @order.id
      end
    end

    # describe 'CREATE' do
    #   before do
    #     post :create, {customer_id: @customer.id, products: [{product_id: @product.id, quantity: 1}]
    #   end
    #   it 'should assign customer ' do
    #     binding.pry
    #     expect(assigns(:customer)).to eq(@customer)
    #   end
    # end
end

require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do
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
      store_id: @store.id,
    )

    request.env['HTTP_AUTHORIZATION'] = "Token token=#{@store.api_key}"
    get :show, { id: @customer.id }, { 'Authorization' => "Token token=#{@store.api_key}" }
  end

  describe 'SHOW ' do
    it 'should assign variable' do
      expect(assigns(:customer).id).to eq(@customer.id)
    end
    it 'should render json for the correct customer' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['id']).to eql @customer.id
    end
  end

  describe 'CREATE' do
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
    @customer_valid = {
      name: 'test',
      email: 'test@test.com',
      password: 'testtest',
      store_id: @store.id,
    }

    @customer_invalid = {
      name: 'tsdf',
      email: 'test@test.com',
      password: '',
      store_id: @store.id
    }
      @request.env['HTTP_AUTHORIZATION'] = "Token token=#{@store.api_key}"

    end

    context 'post with valid information' do
      before do
        post :create, @customer_valid
      end


      it 'should set customer variable and save to database' do
        expect(Customer.last.name).to eql @customer_valid[:name]
      end

      it 'should add the customer to the store' do
        expect(assigns[:store].customers.last.name).to eql @customer_valid[:name]
      end

      it 'should render json for the correct customer' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['name']).to eql @customer_valid[:name]
      end
    end

    context 'post with invalid information' do
      before do
        post :create, @customer_invalid
      end

      it 'should render JSON error message' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['error'].length).to eql 1
      end
    end

    # describe 'UPDATE' do
    #   before do
    #     @customer_one = Customer.create!(
    #       name: 'test',
    #       email: 'test@test.com',
    #       password: 'testtest',
    #       store_id: @store.id
    #     )
    #     updated_customer = {
    #       name: 'testtest',
    #       email: 'test@test.com',
    #       password: 'testtest',
    #       store_id: @store.id
    #     }
    #       request.env['HTTP_AUTHORIZATION'] = "Token token=#{@store.api_key}"
    #       put :update, { id: @customer_one.id, customer: updated_customer }, {'Authorization' => "Token token=#{@store.api_key}" }
    #   end

    #   # it 'should update customer' do
    #   #   binding.pry
    #   #   expect(@customer.name).to eq('testtest')
    #   # end
    # end
  end

#xhr :put, :update, :format => "js"


  # describe 'Index' do
  #   before do
  #     @current_user = User.create!(
  #       name: 'test',
  #       email: 'test@test.com',
  #       password: 'testtest',
  #       password_confirmation: 'testtest'
  #     )
  #     @store = Store.create!(
  #       name: 'test_store',
  #       description: 'test_store_desciption',
  #       api_key: '',
  #       api_secret: '',
  #       user_id: @current_user.id
  #       )
  #     @customer = Customer.create!(
  #     name: 'test',
  #     email: 'test@test.com',
  #     password: 'testtest'
  #       )
  #     @store.customers << @customer
  #     get :index, nil, { user_id: @current_user.id}
  #   end
  #   it 'should assign customers variable' do
  #     expect(assigns(:customers)).to eq(@store.customers)
  #   end
  # end

  #   @category = Category.create!(
  #     name: 'test_category',
  #     description: 'test_category_desciption',
  #     store_id: @store.id
  #   )
  #   @product = Product.create!(
  #     name: 'test_product',
  #     description: 'test_description',
  #     short_description: 'test_short_description',
  #     price: 'test_price',
  #     product_attributes: 'test_product_attributes',
  #     store_id: @store.id,
  #     image: 'test_image',
  #     category_ids: [@category.id]
  #   )
  #   @customer = {
  #     name: 'test',
  #     email: 'test@test.com'
  #   }
  #   post :create, {customer: @customer }, { }
  # end
  # describe 'receiving JSON and saving in database' do
  #   describe 'CREATE POST' do
  #     it 'should take JSON and save to database' do

  #     end
  #   end
  # end

end

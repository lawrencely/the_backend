require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do

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

require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
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
      user_id: @current_user.id
    )
    @category = Category.create!(
      name: 'test_category',
      description: 'test_description',
      store_id: @store.id
    )
  end
  describe 'NEW get ' do
    before do
      get :new, {}, {user_id: @current_user.id}
    end

    it 'should render new form' do
      expect(response).to render_template('new')
    end

    it 'should expect success response' do
      expect(response).to be_success
    end
  end

  describe 'CREATE post' do
    before do
      created_product = {
        name: 'test_product',
        description: 'test_description',
        short_description: 'test_short_description',
        price: 'test_price',
        product_attributes: 'test_product_attributes',
        store_id: @store.id,
        image: 'test_image',
        category_ids: [@category.id]
      }
      post :create, { product: created_product }, { user_id: @current_user.id}
    end

    it 'should save to database' do
      expect(Product.count).to eq(1)
    end
  end

  describe 'EDIT get' do
    before do
      @product = Product.create!(
        name: 'test_product',
        description: 'test_description',
        short_description: 'test_short_description',
        price: 'test_price',
        product_attributes: 'test_product_attributes',
        store_id: @store.id,
        image: 'test_image'
      )
      get :edit, { id: @product.id }, { user_id: @current_user.id }
    end

    it 'should render the edit page' do
      expect(response).to render_template('edit')
    end

    it 'should have a success 202' do
      expect(response).to be_success
    end
  end
end

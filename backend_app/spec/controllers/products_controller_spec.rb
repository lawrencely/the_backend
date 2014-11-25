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
      api_key: '',
      api_secret: '',
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

    it 'should have the same properties as created' do
      expect(Product.first.name).to eq('test_product')
    end
  end

  describe 'CREATE if failed validation' do
    before do
      created_product = {
        name: '',
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

    it 'should render new template for failed validation' do
      expect(response).to render_template('new')
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

  describe 'PUT UPDATE' do
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
      updated_product = {
        name: 'updated_product',
        description: 'test_product_desciption',
        short_description: 'test_short_description',
        price: 'test_price',
        product_attributes: 'test_product_attributes',
        store_id: @store.id,
        image: 'test_image'
      }
      put :update, { id: @product.id, product: updated_product }, { user_id: @current_user.id }
    end
    it 'should update the database' do
      @product.reload
      expect(@product.name).to eq('updated_product')
    end

    it 'should validate by checking if product store id and users store id match' do
      expect(@product.store_id).to eq(@store.id)
    end

    it 'should redirect to root path' do
      expect(response).to redirect_to(root_path)
    end
  end
  describe 'UPDATE PUT which failed validation' do
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
      updated_product = {
        name: '',
        description: 'test_product_desciption',
        short_description: 'test_short_description',
        price: 'test_price',
        product_attributes: 'test_product_attributes',
        store_id: @store.id,
        image: 'test_image'
      }
      put :update, { id: @product.id, product: updated_product }, { user_id: @current_user.id }
    end
    it 'should render new template for failing validation' do
      expect(response).to render_template('new')
    end
  end

  describe 'DESTROY PRODUCT' do
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

      delete :destroy, { id: @product.id }, {user_id: @current_user.id}
    end
    it 'should delete from database product' do
      expect(Product.count).to eq(0)
    end
  end
end

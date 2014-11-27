require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
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
  end
  describe 'GET new ' do
    before do
      get 'new', {}, {user_id: @current_user.id}
    end
    it 'should get the new form for categories' do
      expect(response).to render_template('new')
    end

    it 'should show success 202' do
      expect(response).to be_success
    end
  end

  describe 'CREATE new category' do
    before do
      created_category = {
        name: 'test_category',
        description: 'test_category_desciption',
        store_id: @store.id
      }
      post :create, { id: @current_user.id, category: created_category }, { user_id: @current_user.id }
    end

    it 'should assign category to current user store id' do
      expect(Category.last.store_id).to eq(@store.id)
    end

    it 'should create new category' do
      expect(Category.count).to eq(1)
    end

    it 'should assign category to current user store id ' do
      expect(assigns(:store).id).to eq(assigns(:category).store_id)
    end

    it 'should redirect to root path' do
      expect(response).to redirect_to(store_path(@current_user.stores.first.id))
    end
  end
  describe 'invalid category' do
    before do
      created_category = {
        name: '',
        description: 'test_category_desciption',
        store_id: @store.id
      }
      post :create, { id: @current_user.id, category: created_category }, { user_id: @current_user.id }
    end
    it 'should render new template if unvalid' do
      expect(response).to render_template('new')
    end
  end

  describe 'EDIT category' do
    before do
      @category = Category.create!(
        name: 'test_category',
        description: 'test_category_desciption',
        store_id: @store.id
        )
      get :edit, { id: @category.id }, {user_id: @current_user.id }
    end

    it 'should be able to render edit form' do
      expect(response).to render_template('edit')
    end

    it 'should have a success render' do
      expect(response).to be_success
    end
  end

  describe 'UPDATE category' do
    before do
      @category = Category.create!(
        name: 'test_category',
        description: 'test_category_desciption',
        store_id: @store.id
      )
      updated_category = {
        name: 'updated_category',
        description: 'test_category_desciption',
        store_id: @store.id
      }
      put :update, { id: @category.id, category: updated_category }, { user_id: @current_user.id }
    end

    it 'should update the category' do
      @category.reload
      expect(@category.name).to eq('updated_category')
    end

    it 'should check that its assigned to current user only' do
      @category.reload
      expect(@category.store_id).to eq(@store.id)
    end

    it 'should update in the database' do
      expect(Category.count).to eq(1)
    end

    it 'should redirect to root path' do
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'UPDATE category with failed validations' do
    before do
      @category = Category.create!(
        name: 'test_category',
        description: 'test_category_desciption',
        store_id: @store.id
      )
      updated_category = {
        name: '',
        description: 'test_category_desciption',
        store_id: @store.id
      }
      put :update, { id: @category.id, category: updated_category }, { user_id: @current_user.id }
    end
    it 'should render new category form' do
      expect(response).to render_template('new')
    end
  end

  describe 'DESTROY delete' do
    before do
      @category = Category.create!(
        name: 'test_category',
        description: 'test_category_desciption',
        store_id: @store.id
      )
      delete :destroy, { id: @category.id }, {user_id: @current_user.id }
    end

    it 'should delete category' do
      expect(Category.count).to eq(0)
    end

    it 'should redirect to root' do
      expect(response).to redirect_to(root_path)
    end
  end
end

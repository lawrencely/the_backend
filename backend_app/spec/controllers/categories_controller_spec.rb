require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
  before do
    @user = User.create!(
      name: 'test',
      email: 'test@test.com',
      password: 'test',
      password_confirmation: 'test'
    )
    @store = Store.create!(
      name: 'test_store',
      description: 'test_store_desciption',
      user_id: @user.id
    )
    get 'new'
  end
  describe 'GET new ' do
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
      post :create, { id: @user.id, category: created_category }, { user_id: @user.id }
    end

    it 'should assign category to current user store id' do
      expect(Category.last.store_id).to eq(@store.id)
    end

    it 'should create new category' do
      expect(Category.count).to eq(1)
    end

    it 'should assign category to current user' do
      expect(assigns(@category.store_id)).to eq(assigns(@store.id))
    end

    it 'should redirect to root path' do
      expect(response).to redirect_to(root_path)
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
      get :edit, { id: @category.id }
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
        name: 'updated_category'
      }
      put :update, { id: @user.id, store: updated_category }, { user_id: @user.id }
    end

    it 'should update the category' do
      @category.reload
      expect(@category.name).to eq('updated_category')
    end

    it 'should check that its assigned to current user only' do
      expect(@category.store_id).to eq(@store.id)
    end

    it 'should update in the database' do
      expect(Category.count).to eq(1)
    end

    it 'should redirect to root path' do
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'DESTROY delete' do
    it 'should delete category' do
    end
  end
end

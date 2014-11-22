require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
  before do
    @user = User.create!(
      name: 'test',
      email: 'test@test.com',
      password: 'test',
      password_confirmation: 'test'
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
      created_category = {
        name: 'test_category',
        description: 'test_category_desciption',
        store_id: @store.id
      }
      post :create, { id: @store.user_id, category: created_category }, { user_id: @store.user_id }
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
    end
  end

  describe 'EDIT category' do
    it 'should be able to render edit form' do
    end

    it 'should show success 202' do
    end
  end

  describe 'UPDATE category' do
    it 'should update the category' do
    end

    it 'should check that its assigned to current user only' do
    end

    it 'should update in the database' do
    end
    describe 'if another user is trying to update category' do
      it 'should redirect to root path' do
      end
    end
  end
end

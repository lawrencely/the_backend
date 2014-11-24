require 'rails_helper'

RSpec.describe StoresController, :type => :controller do
  before do
    @current_user = User.create!(
      name: 'test',
      email: 'test@test.com',
      password: 'testtest',
      password_confirmation: 'testtest'
      )
  end

  describe 'GET new for store' do
    before do
      get :new
    end
    it 'should render new store page' do
      expect(response).to render_template('new')
    end
  end

  describe 'POST create new store' do
    before do
      created_store = {
        name: 'test_store',
        description: 'test_store_desciption'
      }
      post :create, {id: @current_user.id, store:created_store}, { user_id: @current_user.id }
    end

    it 'should assign store to current user' do
      expect(Store.last.user_id).to eq(@current_user.id)
    end

    it 'should create a store' do
      expect(Store.count).to eq(1)
    end

    it 'should redirect to root path' do
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'POST create new store' do
    before do
      created_store = {
        name: '',
        description: 'test_store_desciption'
      }
      post :create, {id: @current_user.id, store:created_store}, { user_id: @current_user.id }
    end
    it 'should render back new template for failing validation' do
      expect(response).to render_template('new')
    end
  end

  describe 'GET edit page for store' do
    before do
      @store = Store.create!(
        name: 'test_store',
        description: 'test_store_desciption'
        )
      get :edit, { id: @store.id }
    end

    it 'should render the edit page' do
      expect(response).to render_template('edit')
    end

    it 'should give a success response' do
      expect(response).to be_success
    end
  end

  describe 'UPDATE post page ' do
    before do
      @store = Store.create!(
        name: 'test_store',
        description: 'test_store_desciption',
        user_id: @current_user.id
      )
      updated_store = {
        name: 'updated_store',
        description: 'updated_description'
      }
      put :update, { id: @store.id, store: updated_store }, { user_id: @current_user.id }
    end

    it 'should assign current user to store user id' do
      #expect(assigns(:current_user).id).to eq(assigns(:store).user_id))
      @store.reload
      expect(@store.user_id).to eq(@current_user.id)
    end

    it 'should update store in database' do
      @store.reload
      expect(@store.name).to eq('updated_store')
    end

    it 'should redirect to root path ' do
      expect(response).to redirect_to(root_path)
    end
  end

    describe 'if user update does not pass validation method' do
      before do
        @store = Store.create!(
        name: 'test_store',
        description: 'test_store_desciption',
        user_id: @current_user.id
        )
        updated_store = {
          name: '',
          description: 'updated description',
          user_id: @current_user.id
        }
        put :update, { id: @store.id, store: updated_store }, { user_id: @current_user.id }
      end
      it 'should render new template' do
        expect(response).to render_template('new')
      end
    end

  describe 'DELETE a store' do
    before do
      @store_delete = Store.create!(
      name: 'test_store',
      description: 'test_store_desciption',
      user_id: @current_user.id
      )
      delete :destroy, { id: @store_delete.id }, { user_id: @current_user.id }
    end

    it 'should empty from database' do
      expect(Store.count).to eq(0)
    end

    it 'should redirect to root path' do
      expect(response).to redirect_to(root_path)
    end
  end
end

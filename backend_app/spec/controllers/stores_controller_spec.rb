require 'rails_helper'

RSpec.describe StoresController, :type => :controller do
  before do
    @user = User.create!(
      name: 'test',
      email: 'test@test.com',
      password: 'test',
      password_confirmation: 'test'
      )
    get 'new'
  end

  describe 'GET new for store' do
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
      post :create, {id: @user.id, store:created_store} , { user_id: @user.id }
    end

    it 'should assign store to current user' do
      expect(Store.last.user_id).to eq(@user.id)
    end

    it 'should create a store' do
      expect(Store.count).to eq(1)
    end

    it 'should redirect to root path' do
      expect(response).to redirect_to(root_path)
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
      @store_update = Store.create!(
        name: 'test_store',
        description: 'test_store_desciption'
        )
      updated_store = {
        name: 'updated store',
        description: 'updated description'
      }

      put :update, { id: @store_update.id, store: updated_store }, { user_id: @user.id }
    end

    it 'should update store in database' do
      @store_update.reload
      expect(@store_update.name).to eq('updated store')
    end

########################################################## test below doesnt work ##############

    describe 'if user not equal to store.user.id' do
      before do
        @store = Store.create!(
        name: 'test_store',
        description: 'test_store_desciption'
        )
        updated_store = {
          name: 'updated store',
          description: 'updated description'
        }

        put :update, { id: @store.id, store: updated_store }, { user_id: @user.id }
      end


      it 'should render new template' do
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE a store' do

  end
end

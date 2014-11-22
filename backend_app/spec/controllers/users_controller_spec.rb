require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'GET new method' do
    before do
      get :new
    end
    it 'should show the new html erb page for users' do
      expect(response).to render_template('new')
    end
  end

  describe 'POST create new user' do
    context 'user entered valid information' do
      before do
        post :create, user:{
          name: "test",
          email: "test@test.com",
          password:"test",
          password_confirmation: "test"
        }
      end

      it 'should create a user in the database' do
        expect(User.count).to eq(1)
      end

      it 'should redirect to the pages' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'user entered invalid information' do
      before do
        post :create, user:{
            name: "test",
            email: "test@test.com",
            password:"test",
            password_confirmation: "test123"
        }
      end

      it 'shouldnt create a user in the database' do
        expect(User.count).to eq(0)
      end

      it "should redirect to the new user page " do
        expect(response).to render_template('new')
      end
    end
  end

  describe 'EDIT' do
    before do
        @user = User.create!(
          name: "test",
          email: "test@test.com",
          password:'test',
          password_confirmation: 'test'
        )
        get :edit, { :id => @user.id }, { user_id: @user.id }
    end
    it 'should get the edit page' do
      expect(response).to render_template('edit')
    end

    it 'should give a success response' do
      expect(response).to be_success
    end

    it 'should assign current user to user' do
      expect(assigns(:current_user)).to eq(assigns(:user))
    end
  end

  describe 'UPDATE' do
    before do
      @user = User.create!(
        name: "test",
        email: "test@test.com",
        password:"test",
        password_confirmation: "test"
      )

      updated_user = {
        name: @user.name,
        email: "edit@test.com"
      }

      put :update, {id: @user.id, user: updated_user}, { user_id: @user.id }
    end

    it 'should show edit@test.com in database' do
      @user.reload #reloads from database
      expect(@user.email).to eq('edit@test.com')
    end
  end

end

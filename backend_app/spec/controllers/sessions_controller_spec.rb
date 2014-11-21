require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  before do
  @user = User.create(
    name: "test",
    email: "test@test.com",
    password:'test',
    password_confirmation: 'test'
    )
  end

  context 'logging in ' do

    describe 'NEW for sessions controller' do
      it 'GET request for a new session' do
        get :new
        expect(response).to be_success
      end
    end

    describe 'POST login sessions controller' do

      describe 'successful login' do
        it 'should POST and assgin the user as current user' do
          post :create, { username: @user.name, password: @user.password }
          expect(session[:user_id]).to eq(@user.id)
          expect(response).to redirect_to(root_path)
        end
      end

      describe 'unsuccessful login' do
        it 'should redirect to login path' do
          post :create, {username: '', password: 'hotdogs'}
          expect(response).to redirect_to(login_path)
        end
      end

    end


    describe 'DESTROY for sessions controller' do
      it "destory the session and redirect to login path" do
        delete :destroy
        expect(session[:user_id]).to be_nil
        expect(response).to redirect_to(login_path)
      end
    end

  end

end

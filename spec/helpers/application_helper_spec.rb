require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe 'user logged in' do
    before do
      @current_user = User.create!(
        name: 'test',
        email: 'test@test.com',
        password: 'testtest',
        password_confirmation: 'testtest'
      )
    end
    it 'should have the right links' do
      expect(helper.intellinav).to have_link('Edit profile', edit_user_path)
      expect(helper.intellinav).to have_link('My Categories', categories_path)
      expect(helper.intellinav).to have_link('Create Category', new_category_path )
      expect(helper.intellinav).to have_link('My Products', products_path )
      expect(helper.intellinav).to have_link('Edit profile', edit_user_path)
      expect(helper.intellinav).to have_link('Add Products', new_product_path )
      expect(helper.intellinav).to have_link('Sign Out ' + @current_user.name.capitalize, login_path )
    end
  end
  describe 'user not logged in' do
    before do

    end
    it 'should have the unregistered links' do
      expect(helper.intellinav).to have_link('Sign up', new_user_path)
      expect(helper.intellinav).to have_link('Sign in', login_path)
    end
  end
end
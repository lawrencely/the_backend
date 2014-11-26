module ApplicationHelper
  def intellinav
    nav = ''
    if @current_user.present?
      nav += "<li>" + link_to('Home', root_path) + "</li> "
      nav += "<li>" + link_to('Store', stores_path) + "</li> "
      nav += "<li>" + link_to('Edit profile', edit_user_path) + "</li> "
      nav += "<li>" + link_to('My Categories', categories_path) + "</li>"
      nav += "<li>" + link_to('Create Category', new_category_path ) + "</li>"
      nav += "<li>" + link_to('My Products', products_path ) + "</li>"
      nav += "<li>" + link_to('Add Products', new_product_path ) + "</li>"
      nav += "<li>#{ link_to('Sign Out ' + @current_user.name.capitalize , login_path, :method => :delete, :data => {:confirm => 'Are you sure?'}) }</li>"
    else
      nav += "<li>#{ link_to('Sign up', new_user_path) }</li> "
      nav += "<li>#{ link_to('Sign in', login_path) }</li>"
    end
    nav
  end
end
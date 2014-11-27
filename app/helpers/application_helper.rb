module ApplicationHelper
  def intellinav
    nav = ''
    if @current_user.present?
      # nav += "<div id='navbar' class='navbar-collapse collapse' aria-expanded='false' style='height: 1px;''>"
      #     nav += "<div class='navbar-header'>"
      #       nav += "<button type='button' class='navbar-toggle collapsed' data-toggle='collapse' data-target='#navbar' aria-expanded='false' aria-controls='navbar'>"
      #         nav += "<span class='sr-only'>Toggle navigation</span>"
      #         nav += "<span class='icon-bar'></span>"
      #         nav += "<span class='icon-bar'></span>"
      #         nav += "<span class='icon-bar'></span>"
      #       nav += "</button>"
      #       nav += "<a class='navbar-brand' href='#''>The Backend</a>"
      #     nav += "</div>"
      #   nav += "<ul class='nav navbar-nav navbar-right'>"
      #     nav += "<li class='active'>" + link_to('Edit profile', edit_user_path) + "</li> "
      #     nav += "<li class='active'>#{ link_to('Sign Out ' + @current_user.name.capitalize , login_path, :method => :delete, :data => {:confirm => 'Are you sure?'}) }</li>"
      #   nav += "</ul>"
      #   nav += "<form class='navbar-form navbar-right'>"
      #     nav += "<input type='text' class='form-control' placeholder='Search...'>"
      #   nav += "</form>"
      # nav += "</div>"


      nav += "<nav class='navbar navbar-inverse navbar-fixed-top' role='navigation'>"
          nav += "<div class='navbar-header'>"
            nav += "<button type='button' class='navbar-toggle collapsed' data-toggle='collapse' data-target='#navbar' aria-expanded='false' aria-controls='navbar'>"
              nav += "<span class='sr-only'>Toggle navigation</span>"
              nav += "<span class='icon-bar'></span>"
              nav += "<span class='icon-bar'></span>"
              nav += "<span class='icon-bar'></span>"
            nav += "</button>"
            nav += "<a class='navbar-brand' href='#{root_path}''>The Backend</a>"
          nav += "</div>"
          nav += "<div id='navbar' class='navbar-collapse collapse' aria-expanded='false' style='height: 1px;'>"
            nav += "<ul class='nav navbar-nav navbar-right'>"
              nav += "<li class='active'>" + link_to('Edit profile', edit_user_path) + "</li> "
              nav += "<li class='active'>#{ link_to('Sign Out ' + @current_user.name.capitalize , login_path, :method => :delete, :data => {:confirm => 'Are you sure?'}) }</li>"
            nav += "</ul>"
            nav += "<form class='navbar-form navbar-right'>"
              nav += "<input type='text' class='form-control' placeholder='Search...'>"
            nav += "</form>"
          nav += "</div>"
      nav += "</nav>"


      # nav += "<ul class='nav nav-stacked col-md-2'>"
      # nav += "<li class='active'>" + link_to('Home', root_path) + "</li> "
      # nav += "<li class='active'>" + link_to('Store', stores_path) + "</li> "
      # nav += "<li class='active'>" + link_to('My Categories', categories_path) + "</li>"
      # nav += "<li class='active'>" + link_to('Create Category', new_category_path ) + "</li>"
      # nav += "<li class='active'>" + link_to('My Products', products_path ) + "</li>"
      # nav += "<li class='active'>" + link_to('Add Products', new_product_path ) + "</li>"
      # nav += "</ul>"



        nav += "<ul class='nav nav-sidebar col-md-2 sidebar'>"
          nav += "<li class='active'>" + link_to('Home', "stores/#{(@current_user.stores.first.id)}") + "</li> "
          nav += "<li class='active'>" + link_to('Create Category', new_category_path ) + "</li>"
          nav += "<li class='active'>" + link_to('Add Products', new_product_path ) + "</li>"
          nav += "<li class='active'><a href='#''>Overview<span class='sr-only'>(current)</span></a></li>"
          nav += "<li class='active'><a href='#'>Reports</a></li>"
          nav += "<li class='active'><a href='#'>Analytics</a></li>"
          nav += "<li class='active'><a href='#'>Export</a></li>"
          nav += "<li class='active'><a href='#'>Nav item again</a></li>"
          nav += "<li class='active'><a href='#'>One more nav</a></li>"
          nav += "<li class='active'><a href='#'>Another nav item</a></li>"
        nav += "</ul>"




    else
      nav += "<div class='container-fluid'>"
        nav += "<div id='navbar' class='navbar-collapse collapse' aria-expanded='false' style='height: 1px;'>"
          nav += "<ul class='nav navbar-nav navbar-right'>"
            nav += "<li class='active'>#{ link_to('Sign in', login_path) }</li> "
            nav += "<li class='active'>#{ link_to('Sign up', new_user_path) }</li> "
          nav += "</ul>"
        nav += "</div>"
      nav += "</div>"
    end
    nav
  end
end


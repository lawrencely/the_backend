# == Route Map
#
#          Prefix Verb   URI Pattern                     Controller#Action
#      categories GET    /categories(.:format)           categories#index
#                 POST   /categories(.:format)           categories#create
#    new_category GET    /categories/new(.:format)       categories#new
#   edit_category GET    /categories/:id/edit(.:format)  categories#edit
#        category GET    /categories/:id(.:format)       categories#show
#                 PATCH  /categories/:id(.:format)       categories#update
#                 PUT    /categories/:id(.:format)       categories#update
#                 DELETE /categories/:id(.:format)       categories#destroy
#           users GET    /users(.:format)                users#index
#                 POST   /users(.:format)                users#create
#        new_user GET    /users/new(.:format)            users#new
#            user GET    /users/:id(.:format)            users#show
#                 PATCH  /users/:id(.:format)            users#update
#                 PUT    /users/:id(.:format)            users#update
#                 DELETE /users/:id(.:format)            users#destroy
#       customers GET    /customers(.:format)            customers#index
#                 POST   /customers(.:format)            customers#create
#    new_customer GET    /customers/new(.:format)        customers#new
#   edit_customer GET    /customers/:id/edit(.:format)   customers#edit
#        customer GET    /customers/:id(.:format)        customers#show
#                 PATCH  /customers/:id(.:format)        customers#update
#                 PUT    /customers/:id(.:format)        customers#update
#                 DELETE /customers/:id(.:format)        customers#destroy
#        products GET    /products(.:format)             products#index
#                 POST   /products(.:format)             products#create
#     new_product GET    /products/new(.:format)         products#new
#    edit_product GET    /products/:id/edit(.:format)    products#edit
#         product GET    /products/:id(.:format)         products#show
#                 PATCH  /products/:id(.:format)         products#update
#                 PUT    /products/:id(.:format)         products#update
#                 DELETE /products/:id(.:format)         products#destroy
#          orders GET    /orders(.:format)               orders#index
#                 POST   /orders(.:format)               orders#create
#       new_order GET    /orders/new(.:format)           orders#new
#      edit_order GET    /orders/:id/edit(.:format)      orders#edit
#           order GET    /orders/:id(.:format)           orders#show
#                 PATCH  /orders/:id(.:format)           orders#update
#                 PUT    /orders/:id(.:format)           orders#update
#                 DELETE /orders/:id(.:format)           orders#destroy
#     order_items GET    /order_items(.:format)          order_items#index
#                 POST   /order_items(.:format)          order_items#create
#  new_order_item GET    /order_items/new(.:format)      order_items#new
# edit_order_item GET    /order_items/:id/edit(.:format) order_items#edit
#      order_item GET    /order_items/:id(.:format)      order_items#show
#                 PATCH  /order_items/:id(.:format)      order_items#update
#                 PUT    /order_items/:id(.:format)      order_items#update
#                 DELETE /order_items/:id(.:format)      order_items#destroy
#          stores GET    /stores(.:format)               stores#index
#                 POST   /stores(.:format)               stores#create
#       new_store GET    /stores/new(.:format)           stores#new
#      edit_store GET    /stores/:id/edit(.:format)      stores#edit
#           store GET    /stores/:id(.:format)           stores#show
#                 PATCH  /stores/:id(.:format)           stores#update
#                 PUT    /stores/:id(.:format)           stores#update
#                 DELETE /stores/:id(.:format)           stores#destroy
#           pages GET    /pages(.:format)                pages#index
#                 POST   /pages(.:format)                pages#create
#        new_page GET    /pages/new(.:format)            pages#new
#       edit_page GET    /pages/:id/edit(.:format)       pages#edit
#            page GET    /pages/:id(.:format)            pages#show
#                 PATCH  /pages/:id(.:format)            pages#update
#                 PUT    /pages/:id(.:format)            pages#update
#                 DELETE /pages/:id(.:format)            pages#destroy
#            root GET    /                               pages#home
#           login GET    /login(.:format)                sessions#new
#                 POST   /login(.:format)                sessions#create
#                 DELETE /login(.:format)                sessions#destroy
#       edit_user GET    /users/edit(.:format)           users#edit
#

Rails.application.routes.draw do
  resources :categories
  resources :users, :except => [:edit]
  resources :customers
  resources :products
  resources :orders
  resources :order_items
  resources :stores
  resources :pages

  root 'pages#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'
  get '/users/edit' => 'users#edit', :as => :edit_user

end

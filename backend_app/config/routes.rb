# == Route Map
#
#           Prefix Verb   URI Pattern                    Controller#Action
#   category_index GET    /category(.:format)            category#index
#                  POST   /category(.:format)            category#create
#     new_category GET    /category/new(.:format)        category#new
#    edit_category GET    /category/:id/edit(.:format)   category#edit
#         category GET    /category/:id(.:format)        category#show
#                  PATCH  /category/:id(.:format)        category#update
#                  PUT    /category/:id(.:format)        category#update
#                  DELETE /category/:id(.:format)        category#destroy
#            users GET    /users(.:format)               users#index
#                  POST   /users(.:format)               users#create
#         new_user GET    /users/new(.:format)           users#new
#             user GET    /users/:id(.:format)           users#show
#                  PATCH  /users/:id(.:format)           users#update
#                  PUT    /users/:id(.:format)           users#update
#                  DELETE /users/:id(.:format)           users#destroy
#   customer_index GET    /customer(.:format)            customer#index
#                  POST   /customer(.:format)            customer#create
#     new_customer GET    /customer/new(.:format)        customer#new
#    edit_customer GET    /customer/:id/edit(.:format)   customer#edit
#         customer GET    /customer/:id(.:format)        customer#show
#                  PATCH  /customer/:id(.:format)        customer#update
#                  PUT    /customer/:id(.:format)        customer#update
#                  DELETE /customer/:id(.:format)        customer#destroy
#    product_index GET    /product(.:format)             product#index
#                  POST   /product(.:format)             product#create
#      new_product GET    /product/new(.:format)         product#new
#     edit_product GET    /product/:id/edit(.:format)    product#edit
#          product GET    /product/:id(.:format)         product#show
#                  PATCH  /product/:id(.:format)         product#update
#                  PUT    /product/:id(.:format)         product#update
#                  DELETE /product/:id(.:format)         product#destroy
#      order_index GET    /order(.:format)               order#index
#                  POST   /order(.:format)               order#create
#        new_order GET    /order/new(.:format)           order#new
#       edit_order GET    /order/:id/edit(.:format)      order#edit
#            order GET    /order/:id(.:format)           order#show
#                  PATCH  /order/:id(.:format)           order#update
#                  PUT    /order/:id(.:format)           order#update
#                  DELETE /order/:id(.:format)           order#destroy
# order_item_index GET    /order_item(.:format)          order_item#index
#                  POST   /order_item(.:format)          order_item#create
#   new_order_item GET    /order_item/new(.:format)      order_item#new
#  edit_order_item GET    /order_item/:id/edit(.:format) order_item#edit
#       order_item GET    /order_item/:id(.:format)      order_item#show
#                  PATCH  /order_item/:id(.:format)      order_item#update
#                  PUT    /order_item/:id(.:format)      order_item#update
#                  DELETE /order_item/:id(.:format)      order_item#destroy
#      store_index GET    /store(.:format)               store#index
#                  POST   /store(.:format)               store#create
#        new_store GET    /store/new(.:format)           store#new
#       edit_store GET    /store/:id/edit(.:format)      store#edit
#            store GET    /store/:id(.:format)           store#show
#                  PATCH  /store/:id(.:format)           store#update
#                  PUT    /store/:id(.:format)           store#update
#                  DELETE /store/:id(.:format)           store#destroy
#            pages GET    /pages(.:format)               pages#index
#                  POST   /pages(.:format)               pages#create
#         new_page GET    /pages/new(.:format)           pages#new
#        edit_page GET    /pages/:id/edit(.:format)      pages#edit
#             page GET    /pages/:id(.:format)           pages#show
#                  PATCH  /pages/:id(.:format)           pages#update
#                  PUT    /pages/:id(.:format)           pages#update
#                  DELETE /pages/:id(.:format)           pages#destroy
#             root GET    /                              pages#home
#            login GET    /login(.:format)               sessions#new
#                  POST   /login(.:format)               sessions#create
#                  DELETE /login(.:format)               sessions#destroy
#        edit_user GET    /users/edit(.:format)          users#edit
#

Rails.application.routes.draw do
  resources :category
  resources :users, :except => [:edit]
  resources :customer
  resources :product
  resources :order
  resources :order_item
  resources :store
  resources :pages

  root 'pages#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'
  get '/users/edit' => 'users#edit', :as => :edit_user

end
